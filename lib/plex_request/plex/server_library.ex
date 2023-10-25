defmodule PlexRequest.Plex.ServerLibrary do
  use Ecto.Schema
  import Ecto.Changeset

  schema "server_library" do
    field :name, :string
    belongs_to :library, PlexRequest.Plex.Library
    belongs_to :server, PlexRequest.Plex.Server

    timestamps()
  end

  @doc false
  def changeset(server_library, attrs) do
    server_library
    |> cast(attrs, [:name, :library_id, :server_id])
    |> validate_required([:name, :library_id, :server_id])
    |> foreign_key_constraint(:library_id)
    |> foreign_key_constraint(:server_id)
    |> unique_constraint(:library_id)
    |> unique_constraint(:server_id)
  end
end
