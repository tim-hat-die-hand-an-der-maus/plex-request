defmodule PlexRequest.Plex.Library do
  use Ecto.Schema
  import Ecto.Changeset

  schema "library" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(library, attrs) do
    library
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
