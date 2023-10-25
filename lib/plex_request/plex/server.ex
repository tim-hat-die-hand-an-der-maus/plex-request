defmodule PlexRequest.Plex.Server do
  use Ecto.Schema
  import Ecto.Changeset

  schema "server" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(server, attrs) do
    server
    |> cast(attrs, [:name])
    |> validate_required([:name])
    |> unique_constraint(:name)
  end
end
