defmodule Moon.Base.Manufacturer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "manufacturers" do
    field :name, :string
    field :image_url, :string

    timestamps()
  end

  @doc false
  def changeset(manufacturer, attrs) do
    manufacturer
    |> cast(attrs, [:name, :image_url])
    |> validate_required([:name])
  end
end
