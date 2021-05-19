defmodule Moon.Repo.Migrations.AddImageUrlToManufacturers do
  use Ecto.Migration

  def change do
    alter table(:manufacturers) do
      add :image_url, :string
    end
  end
end
