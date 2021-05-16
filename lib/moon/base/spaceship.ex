defmodule Moon.Base.Spaceship do
  use Ecto.Schema
  import Ecto.Changeset

  schema "spaceships" do
    field :capacity, :integer
    field :name, :string

    belongs_to :manufacturer, Moon.Base.Manufacturer

    timestamps()
  end

  @doc false
  def changeset(spaceship, attrs) do
    spaceship
    |> cast(attrs, [:name, :capacity])
    |> validate_required([:name, :capacity])
  end
end
