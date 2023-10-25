defmodule PlexRequestWeb.ServerLibraryController do
  use PlexRequestWeb, :controller

  alias PlexRequest.Plex
  alias PlexRequest.Plex.ServerLibrary

  def index(conn, _params) do
    server_library = Plex.list_server_library()
    render(conn, :index, server_library_collection: server_library)
  end

  def new(conn, _params) do
    changeset = Plex.change_server_library(%ServerLibrary{})
    server = Plex.list_server()
    library = Plex.list_library()

    render(conn, :new, changeset: changeset, server_collection: server, library_collection: library)
  end

  def create(conn, %{"server_library" => server_library_params}) do
    case Plex.create_server_library(server_library_params) do
      {:ok, server_library} ->
        conn
        |> put_flash(:info, "Server library created successfully.")
        |> redirect(to: ~p"/server_library/#{server_library}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    server_library = Plex.get_server_library!(id)
    IO.inspect(server_library)
    render(conn, :show, server_library: server_library)
  end

  def edit(conn, %{"id" => id}) do
    server_library = Plex.get_server_library!(id)
    changeset = Plex.change_server_library(server_library)
    server = Plex.list_server()
    library = Plex.list_library()

    render(conn, :edit, server_library: server_library, changeset: changeset, server_collection: server, library_collection: library)
  end

  def update(conn, %{"id" => id, "server_library" => server_library_params}) do
    server_library = Plex.get_server_library!(id)

    case Plex.update_server_library(server_library, server_library_params) do
      {:ok, server_library} ->
        conn
        |> put_flash(:info, "Server library updated successfully.")
        |> redirect(to: ~p"/server_library/#{server_library}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, server_library: server_library, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    server_library = Plex.get_server_library!(id)
    {:ok, _server_library} = Plex.delete_server_library(server_library)

    conn
    |> put_flash(:info, "Server library deleted successfully.")
    |> redirect(to: ~p"/server_library")
  end
end
