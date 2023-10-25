defmodule PlexRequest.Repo.Migrations.CreateServerLibraryItem do
  use Ecto.Migration

  def change do
    create table(:server_library_item) do
      add :name, :string
      add :year, :integer
      add :rating_key, :integer
      add :server_library_id, references(:server_library, on_delete: :nothing)

      timestamps()
    end

    create index(:server_library_item, [:server_library_id])
    create unique_index(:server_library_item, [:rating_key, :server_library_id], name: :unique_server_library_rating_key)
  end
end
