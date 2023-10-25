defmodule PlexRequestWeb.Api.ServerController do
  use PlexRequestWeb, :controller

  alias PlexRequest.Plex
  alias PlexRequest.Plex.Server

  action_fallback PlexRequestWeb.FallbackController

  def index(conn, _params) do
    server = Plex.list_server()
    render(conn, :index, server: server)
  end

  def create(conn, %{"server" => server_params}) do
    with {:ok, %Server{} = server} <- Plex.create_server(server_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/server/#{server}")
      |> render(:show, server: server)
    end
  end

  def show(conn, %{"id" => id}) do
    server = Plex.get_server!(id)
    render(conn, :show, server: server)
  end

  def update(conn, %{"id" => id, "server" => server_params}) do
    server = Plex.get_server!(id)

    with {:ok, %Server{} = server} <- Plex.update_server(server, server_params) do
      render(conn, :show, server: server)
    end
  end

  def delete(conn, %{"id" => id}) do
    server = Plex.get_server!(id)

    with {:ok, %Server{}} <- Plex.delete_server(server) do
      send_resp(conn, :no_content, "")
    end
  end
end
