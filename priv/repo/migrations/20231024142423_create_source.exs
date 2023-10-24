defmodule PlexRequest.Repo.Migrations.CreateSource do
  use Ecto.Migration

  def change do
    create table(:source) do
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:source, [:name])
  end
end
