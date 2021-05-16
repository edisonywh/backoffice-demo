defmodule Moon.Repo.Migrations.CreateJourneys do
  use Ecto.Migration

  def change do
    create table(:journeys) do
      add :ride_id, references(:rides, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:journeys, [:ride_id])
    create index(:journeys, [:user_id])
  end
end
