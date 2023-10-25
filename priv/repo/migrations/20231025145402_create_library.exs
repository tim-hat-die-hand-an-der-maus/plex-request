defmodule PlexRequest.Repo.Migrations.CreateLibrary do
  use Ecto.Migration

  def change do
    create table(:library) do
      add :name, :string

      timestamps()
    end

    create unique_index(:library, [:name])
  end
end
