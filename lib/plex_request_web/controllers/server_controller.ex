defmodule PlexRequestWeb.ServerController do
  use PlexRequestWeb, :controller

  alias PlexRequest.Plex
  alias PlexRequest.Plex.Server

  def index(conn, _params) do
    server = Plex.list_server()
    render(conn, :index, server_collection: server)
  end

  def new(conn, _params) do
    changeset = Plex.change_server(%Server{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"server" => server_params}) do
    case Plex.create_server(server_params) do
      {:ok, server} ->
        conn
        |> put_flash(:info, "Server created successfully.")
        |> redirect(to: ~p"/server/#{server}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    server = Plex.get_server!(id)
    render(conn, :show, server: server)
  end

  def edit(conn, %{"id" => id}) do
    server = Plex.get_server!(id)
    changeset = Plex.change_server(server)
    render(conn, :edit, server: server, changeset: changeset)
  end

  def update(conn, %{"id" => id, "server" => server_params}) do
    server = Plex.get_server!(id)

    case Plex.update_server(server, server_params) do
      {:ok, server} ->
        conn
        |> put_flash(:info, "Server updated successfully.")
        |> redirect(to: ~p"/server/#{server}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, server: server, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    server = Plex.get_server!(id)
    {:ok, _server} = Plex.delete_server(server)

    conn
    |> put_flash(:info, "Server deleted successfully.")
    |> redirect(to: ~p"/server")
  end
end
