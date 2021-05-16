defmodule Moon.Base.Journey do
  use Ecto.Schema
  import Ecto.Changeset

  schema "journeys" do
    belongs_to(:user, Moon.Base.User)
    belongs_to(:ride, Moon.Base.Ride)

    timestamps()
  end

  @doc false
  def changeset(journey, attrs) do
    journey
    |> cast(attrs, [])
    |> validate_required([])
  end
end
