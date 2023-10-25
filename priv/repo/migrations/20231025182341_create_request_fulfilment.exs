defmodule PlexRequest.Repo.Migrations.CreateRequestFulfilment do
  use Ecto.Migration

  def change do
    create table(:request_fulfilment) do
      add :request_id, references(:request, on_delete: :nothing)
      add :server_library_item_id, references(:server_library_item, on_delete: :nothing)

      timestamps()
    end

    create index(:request_fulfilment, [:request_id])
    create index(:request_fulfilment, [:server_library_item_id])
    create unique_index(:request_fulfilment, [:request_id, :server_library_item_id], name: :unique_request_fulfilment)
  end
end
