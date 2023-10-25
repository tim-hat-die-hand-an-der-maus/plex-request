defmodule PlexRequest.Requests.RequestFulfilment do
  use Ecto.Schema
  import Ecto.Changeset

  schema "request_fulfilment" do
    belongs_to :request, PlexRequest.Requests.Request
    belongs_to :server_library_item, PlexRequest.Plex.ServerLibraryItem

    timestamps()
  end

  @doc false
  def changeset(request_fulfilment, attrs) do
    IO.inspect(request_fulfilment)

    request_fulfilment
    |> cast(attrs, [:request_id, :server_library_item_id])
    |> validate_required([:request_id, :server_library_item_id])
    |> foreign_key_constraint(:request_id)
    |> foreign_key_constraint(:server_library_item_id)
    |> unique_constraint(:unique_request_fulfilment, name: :unique_request_fulfilment)
  end
end
