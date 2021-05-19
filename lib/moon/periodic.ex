defmodule Moon.Periodic do
  use GenServer

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  @impl true
  def init(state) do
    schedule_ping()

    {:ok, state}
  end

  @impl true
  def handle_info(:tick, state) do
    Phoenix.PubSub.broadcast(Moon.PubSub, "periodic", {:info, "Hello from PubSub!"})
    schedule_ping()

    {:noreply, state}
  end

  defp schedule_ping, do: Process.send_after(self(), :tick, 5000)
end
