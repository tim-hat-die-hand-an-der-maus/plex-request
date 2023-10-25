defmodule PlexRequestWeb.Api.ServerLibraryItemController do
  use PlexRequestWeb, :controller

  alias PlexRequest.Plex
  alias PlexRequest.Plex.ServerLibraryItem

  action_fallback PlexRequestWeb.FallbackController

  def index(conn, _params) do
    server_library_item = Plex.list_server_library_item()
    render(conn, :index, server_library_item: server_library_item)
  end

  def create(conn, %{"server_library_item" => server_library_item_params}) do
    with {:ok, %ServerLibraryItem{} = server_library_item} <- Plex.create_server_library_item(server_library_item_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/server_library_item/#{server_library_item}")
      |> render(:show, server_library_item: server_library_item)
    end
  end

  def show(conn, %{"id" => id}) do
    server_library_item = Plex.get_server_library_item!(id)
    render(conn, :show, server_library_item: server_library_item)
  end

  def update(conn, %{"id" => id, "server_library_item" => server_library_item_params}) do
    server_library_item = Plex.get_server_library_item!(id)

    with {:ok, %ServerLibraryItem{} = server_library_item} <- Plex.update_server_library_item(server_library_item, server_library_item_params) do
      render(conn, :show, server_library_item: server_library_item)
    end
  end

  def delete(conn, %{"id" => id}) do
    server_library_item = Plex.get_server_library_item!(id)

    with {:ok, %ServerLibraryItem{}} <- Plex.delete_server_library_item(server_library_item) do
      send_resp(conn, :no_content, "")
    end
  end
end
