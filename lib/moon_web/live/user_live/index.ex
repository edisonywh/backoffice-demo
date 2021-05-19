defmodule MoonWeb.UserLive.Index do
  use Backoffice.Resource.Index,
    resolver: Backoffice.Resolvers.Ecto,
    resolver_opts: [
      repo: Moon.Repo,
      order_by: :id
    ],
    resource: Moon.Base.User

  actions do
    action(:page, label: "Page Action", type: :page, handler: &__MODULE__.page/2)

    action(:single,
      label: "Single Action",
      type: :single,
      class: "bg-red-200 hover:bg-red-300 text-red-700 rounded py-2 px-4",
      handler: &__MODULE__.single/2
    )
  end

  def mount(params, session, socket) do
    if connected?(socket) do
      Phoenix.PubSub.subscribe(Moon.PubSub, "users")
    end

    do_mount(params, session, socket)
  end

  def handle_info({level, text}, socket) do
    {:noreply, push_notification(socket, level: level, title: "Title", subtitle: text)}
  end

  def page(socket, ids) do
    Phoenix.PubSub.broadcast!(Moon.PubSub, "users", {:success, inspect(ids)})

    {:noreply, socket}
  end

  def single(socket, id) do
    {:noreply,
     push_notification(socket, level: :error, title: "You tried to destroy", subtitle: id)}
  end

  # actions do
  #   action(:create, type: :page, handler: &__MODULE__.create/2)
  #   action(:retry, type: :single, handler: &__MODULE__.retry/2)
  # end

  # def retry(socket, resource_id) do
  #   ...
  #   {:noreply, socket}
  # end

  # def create(socket, ids) do
  #   ids = Enum.map(&String.to_integer/1)

  #   {:noreply,
  #    push_patch(socket,
  #      to: YourApp.Router.Helpers.live_path(socket, MoonWeb.Backoffice.UserLive.Single, [])
  #    )}
  # end

  # index do
  #   field :id
  #   field :verified, :boolean
  #   field :age, :string, render: &__MODULE__.field/1 # 1-arity only, takes the resource itself
  # end
end
