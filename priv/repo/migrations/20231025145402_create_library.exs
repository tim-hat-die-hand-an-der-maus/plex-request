defmodule PlexRequest.Repo.Migrations.CreateLibrary do
  use Ecto.Migration

  def change do
    create table(:library) do
      add :name, :string

      timestamps()
    end
  end
end
