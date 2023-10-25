defmodule PlexRequest.Repo.Migrations.CreateServerLibrary do
  use Ecto.Migration

  def change do
    create table(:server_library) do
      add :name, :string
      add :server_id, references(:server, on_delete: :nothing), null: false
      add :library_id, references(:library, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:server_library, [:server_id])
    create index(:server_library, [:library_id])
    create unique_index(:server_library, [:server_id, :library_id], name: :unique_serverlibrary)
  end
end
