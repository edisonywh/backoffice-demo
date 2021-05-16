defmodule Moon.Base.Ride do
  use Ecto.Schema
  import Ecto.Changeset

  schema "rides" do
    field :codename, :string
    field :scheduled_at, :utc_datetime
    field :status, Ecto.Enum, values: [:scheduled, :completed, :aborted]

    belongs_to :spaceship, Moon.Base.Spaceship

    has_many :journeys, Moon.Base.Journey
    has_many :users, through: [:journeys, :user]

    timestamps()
  end

  @doc false
  def changeset(ride, attrs) do
    ride
    |> cast(attrs, [:status, :scheduled_at, :codename])
    |> validate_required([:status, :scheduled_at, :codename])
  end
end
