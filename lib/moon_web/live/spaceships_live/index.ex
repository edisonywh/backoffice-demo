defmodule MoonWeb.SpaceshipLive.Index do
  use Backoffice.Resource.Index,
    resolver: Backoffice.Resolvers.Ecto,
    resolver_opts: [
      repo: Moon.Repo,
      order_by: :id
    ],
    resource: Moon.Base.Spaceship

  def mount(params, session, socket) do
    if connected?(socket) do
      Phoenix.PubSub.subscribe(Moon.PubSub, "periodic")
    end

    do_mount(params, session, socket)
  end

  def handle_info({level, text}, socket) do
    {:noreply, push_notification(socket, level: level, title: "From PubSub", subtitle: text)}
  end
end
