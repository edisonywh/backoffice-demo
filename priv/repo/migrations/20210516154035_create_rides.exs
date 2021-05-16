defmodule Moon.Repo.Migrations.CreateRides do
  use Ecto.Migration

  def change do
    create table(:rides) do
      add :status, :string
      add :scheduled_at, :utc_datetime
      add :codename, :string
      add :spaceship_id, references(:spaceships, on_delete: :nothing)

      timestamps()
    end

    create index(:rides, [:spaceship_id])
  end
end
