defmodule PlexRequest.Repo.Migrations.CreateRequest do
  use Ecto.Migration

  def change do
    create table(:request) do
      add :upstream_id, :string, null: false
      add :source_id, references(:source, on_delete: :nothing), null: false

      timestamps()
    end

    create unique_index(:request, [:upstream_id])
    create index(:request, [:source_id])
  end
end
