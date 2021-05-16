defmodule MoonWeb.UserLive.Single do
  use Backoffice.Resource.Single,
    resolver: Backoffice.Resolvers.Ecto,
    resolver_opts: [
      repo: Moon.Repo
    ],
    resource: Moon.Base.User

  # default for both
  form do
    field :name, :string
  end
end
