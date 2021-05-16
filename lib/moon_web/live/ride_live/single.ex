defmodule MoonWeb.RideLive.Single do
  use Backoffice.Resource.Single,
    resolver: Backoffice.Resolvers.Ecto,
    resolver_opts: [
      repo: Moon.Repo,
      preload: [:journeys, :spaceship]
    ],
    resource: Moon.Base.Ride
end
