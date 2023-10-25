defmodule PlexRequestWeb.Api.ServerLibraryController do
  use PlexRequestWeb, :controller

  alias PlexRequest.Plex
  alias PlexRequest.Plex.ServerLibrary

  action_fallback PlexRequestWeb.FallbackController

  def index(conn, _params) do
    server_library = Plex.list_server_library()
    render(conn, :index, server_library: server_library)
  end

  def create(conn, %{"server_library" => server_library_params}) do
    with {:ok, %ServerLibrary{} = server_library} <- Plex.create_server_library(server_library_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/api/server_library/#{server_library}")
      |> render(:show, server_library: server_library)
    end
  end

  def show(conn, %{"id" => id}) do
    server_library = Plex.get_server_library!(id)
    render(conn, :show, server_library: server_library)
  end

  def update(conn, %{"id" => id, "server_library" => server_library_params}) do
    server_library = Plex.get_server_library!(id)

    with {:ok, %ServerLibrary{} = server_library} <- Plex.update_server_library(server_library, server_library_params) do
      render(conn, :show, server_library: server_library)
    end
  end

  def delete(conn, %{"id" => id}) do
    server_library = Plex.get_server_library!(id)

    with {:ok, %ServerLibrary{}} <- Plex.delete_server_library(server_library) do
      send_resp(conn, :no_content, "")
    end
  end
end
