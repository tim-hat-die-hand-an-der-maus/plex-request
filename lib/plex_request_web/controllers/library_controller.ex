defmodule PlexRequestWeb.LibraryController do
  use PlexRequestWeb, :controller

  alias PlexRequest.Plex
  alias PlexRequest.Plex.Library

  def index(conn, _params) do
    library = Plex.list_library()
    render(conn, :index, library_collection: library)
  end

  def new(conn, _params) do
    changeset = Plex.change_library(%Library{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"library" => library_params}) do
    case Plex.create_library(library_params) do
      {:ok, library} ->
        conn
        |> put_flash(:info, "Library created successfully.")
        |> redirect(to: ~p"/library/#{library}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    library = Plex.get_library!(id)
    render(conn, :show, library: library)
  end

  def edit(conn, %{"id" => id}) do
    library = Plex.get_library!(id)
    changeset = Plex.change_library(library)
    render(conn, :edit, library: library, changeset: changeset)
  end

  def update(conn, %{"id" => id, "library" => library_params}) do
    library = Plex.get_library!(id)

    case Plex.update_library(library, library_params) do
      {:ok, library} ->
        conn
        |> put_flash(:info, "Library updated successfully.")
        |> redirect(to: ~p"/library/#{library}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, library: library, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    library = Plex.get_library!(id)
    {:ok, _library} = Plex.delete_library(library)

    conn
    |> put_flash(:info, "Library deleted successfully.")
    |> redirect(to: ~p"/library")
  end
end
