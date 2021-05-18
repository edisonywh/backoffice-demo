defmodule MoonWeb.SpaceshipLive.Single do
  use Backoffice.Resource.Single,
    resolver: Backoffice.Resolvers.Ecto,
    resolver_opts: [
      repo: Moon.Repo,
      preload: :manufacturer
    ],
    resource: Moon.Base.Spaceship
end
