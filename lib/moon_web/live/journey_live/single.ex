defmodule MoonWeb.JourneyLive.Single do
  use Backoffice.Resource.Single,
    resolver: Backoffice.Resolvers.Ecto,
    resolver_opts: [
      repo: Moon.Repo
    ],
    resource: Moon.Base.Journey
end
