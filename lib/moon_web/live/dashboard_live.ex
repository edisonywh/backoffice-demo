defmodule MoonWeb.DashboardLive do
  use MoonWeb, :live_view

  import Backoffice.LiveView.Helpers
  import Phoenix.View

  def render(assigns) do
    ~L"""
    <div>
    <%= render Backoffice.ResourceView, "_notification.html", [] %>
    <p class='text-4xl font-bold mb-4'>Backoffice Demo</p>

    <section class="mb-8">
      <p class='text-2xl font-semibold mb-2'>Responsive!</p>
      <p class='text-sm text-gray-400'>Backoffice is mobile responsive, give a try!</p>
    </section>

    <section class="mb-8">
    <p class='text-2xl font-semibold mb-2'>Widgets</p>
    <p class='text-sm text-gray-400 mb-2'>Backoffice ships with some widgets, but you can easily implement your own with the `Backoffice.Widget` Protocol</p>
    <div class='grid grid-cols-2 lg:grid-cols-3 gap-4'>
      <%= Backoffice.Widget.render(%MoonWeb.ColoredWidget{title: "Custom widgets", data: "are easy!", color: "blue-400"}) %>
      <%= Backoffice.Widget.render(%Backoffice.PlainWidget{title: "What is the meaning of life?", data: "42"}) %>
    </div>
    </section>

    <section class="mb-8">
    <p class='text-2xl font-semibold mb-2'>Notifications</p>
    <p class='text-sm text-gray-400 mb-2'>Click on the button to see a pop-up notification (triggered by PubSub)</p>
    <button type='button' phx-click='broadcast' class='bg-indigo-500 p-4 cursor-pointer text-white rounded shadow'>Hello Code BEAM!</button>
    </section>

    <section class="mb-8">
    <p class='text-2xl font-semibold mb-2'>Animations</p>
    <p class='text-sm text-gray-400 mb-2'>You saw it with notifications, sidebar as well</p>
    </section>

    </div>
    """
  end

  def mount(_params, _session, socket) do
    if connected?(socket), do: Phoenix.PubSub.subscribe(Moon.PubSub, "journeys")

    {:ok, socket}
  end

  def handle_event("broadcast", _, socket) do
    {:noreply,
     push_notification(socket,
       level: :info,
       title: "Hello!",
       subtitle: "Code BEAM!"
     )}
  end
end
