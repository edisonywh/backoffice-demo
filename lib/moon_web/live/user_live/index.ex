defmodule MoonWeb.UserLive.Index do
  use Backoffice.Resource.Index,
    resolver: Backoffice.Resolvers.Ecto,
    resolver_opts: [
      repo: Moon.Repo,
      order_by: :id
    ],
    resource: Moon.Base.User

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
