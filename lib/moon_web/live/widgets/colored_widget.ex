defmodule MoonWeb.ColoredWidget do
  defstruct [:color, :title, :data]

  defimpl Backoffice.Widget do
    def render(widget) do
      [
        # String interpolating messes with Tailwind purge, for demostration purpose I'll hardcode the color, but you can whitelist the attribute in Tailwind's purge.
        {:safe,
         ~s(<div class="px-4 py-5 bg-blue-400 text-center shadow rounded-lg overflow-hidden sm:p-6">)},
        {:safe, ~s(<dt class="text-sm font-medium text-white truncate">)},
        {:safe, to_string(widget.title)},
        {:safe, ~s(</dt>)},
        {:safe, ~s(<dd class="mt-1 text-3xl font-semibold text-white">)},
        {:safe, to_string(widget.data)},
        {:safe, ~s(</dd>)},
        {:safe, ~s(</div>)}
      ]
    end
  end
end
