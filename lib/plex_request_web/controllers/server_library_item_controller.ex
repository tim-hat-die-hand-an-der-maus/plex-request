defmodule PlexRequestWeb.ServerLibraryItemController do
  use PlexRequestWeb, :controller

  alias PlexRequest.Plex
  alias PlexRequest.Plex.ServerLibraryItem

  def index(conn, _params) do
    server_library_item = Plex.list_server_library_item()

    render(conn, :index, server_library_item_collection: server_library_item)
  end

  def new(conn, _params) do
    changeset = Plex.change_server_library_item(%ServerLibraryItem{})
    server_library = Plex.list_server_library()

    render(conn, :new, changeset: changeset, server_library_collection: server_library)
  end

  def create(conn, %{"server_library_item" => server_library_item_params}) do
    case Plex.create_server_library_item(server_library_item_params) do
      {:ok, server_library_item} ->
        conn
        |> put_flash(:info, "Server library item created successfully.")
        |> redirect(to: ~p"/server_library_item/#{server_library_item}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    server_library_item = Plex.get_server_library_item!(id)
    render(conn, :show, server_library_item: server_library_item)
  end

  def edit(conn, %{"id" => id}) do
    server_library_item = Plex.get_server_library_item!(id)
    changeset = Plex.change_server_library_item(server_library_item)
    server_library = Plex.list_server_library()

    render(conn, :edit, server_library_item: server_library_item, changeset: changeset, server_library_collection: server_library)
  end

  def update(conn, %{"id" => id, "server_library_item" => server_library_item_params}) do
    server_library_item = Plex.get_server_library_item!(id)

    case Plex.update_server_library_item(server_library_item, server_library_item_params) do
      {:ok, server_library_item} ->
        conn
        |> put_flash(:info, "Server library item updated successfully.")
        |> redirect(to: ~p"/server_library_item/#{server_library_item}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, server_library_item: server_library_item, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    server_library_item = Plex.get_server_library_item!(id)
    {:ok, _server_library_item} = Plex.delete_server_library_item(server_library_item)

    conn
    |> put_flash(:info, "Server library item deleted successfully.")
    |> redirect(to: ~p"/server_library_item")
  end
end
