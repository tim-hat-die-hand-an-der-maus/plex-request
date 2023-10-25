defmodule PlexRequest.Plex.ServerLibraryItem do
  use Ecto.Schema
  import Ecto.Changeset

  schema "server_library_item" do
    field :name, :string
    field :year, :integer
    field :rating_key, :integer
    belongs_to :server_library, PlexRequest.Plex.ServerLibrary

    timestamps()
  end

  @doc false
  def changeset(server_library_item, attrs) do
    server_library_item
    |> cast(attrs, [:name, :year, :rating_key, :server_library_id])
    |> validate_required([:name, :year, :rating_key, :server_library_id])
    |> unique_constraint(:unique_server_library_rating_key, name: :unique_server_library_rating_key)
  end
end
