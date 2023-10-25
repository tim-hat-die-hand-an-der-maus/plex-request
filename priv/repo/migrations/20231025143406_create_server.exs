defmodule PlexRequest.Repo.Migrations.CreateServer do
  use Ecto.Migration

  def change do
    create table(:server) do
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:server, [:name])
  end
end
