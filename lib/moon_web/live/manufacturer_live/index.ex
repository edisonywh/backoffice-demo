defmodule MoonWeb.ManufacturerLive.Index do
  use Backoffice.Resource.Index,
    resolver: Backoffice.Resolvers.Ecto,
    resolver_opts: [
      repo: Moon.Repo,
      order_by: :id
    ],
    resource: Moon.Base.Manufacturer

  index do
    field :id, :id
    field :name, :string
    field :image, :string, value: &__MODULE__.image/1
  end

  def image(resource) do
    if resource.image_url != nil do
      """
      <img class='rounded-sm' src="#{resource.image_url}" alt="#{resource.name}" />
      """
    end
  end
end
