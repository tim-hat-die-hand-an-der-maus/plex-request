defmodule PlexRequest.Requests.Request do
  use Ecto.Schema
  import Ecto.Changeset

  schema "request" do
    field :upstream_id, :string
    belongs_to :source, PlexRequest.Requests.Source

    timestamps()
  end

  @doc false
  def changeset(request, attrs) do
    request
    |> cast(attrs, [:upstream_id, :source_id])
    |> validate_required([:upstream_id, :source_id])
  end
end
