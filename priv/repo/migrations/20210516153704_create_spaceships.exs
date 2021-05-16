defmodule Moon.Repo.Migrations.CreateSpaceships do
  use Ecto.Migration

  def change do
    create table(:spaceships) do
      add :name, :string
      add :capacity, :integer
      add :manufacturer_id, references(:manufacturers, on_delete: :nothing)

      timestamps()
    end

    create index(:spaceships, [:manufacturer_id])
  end
end
