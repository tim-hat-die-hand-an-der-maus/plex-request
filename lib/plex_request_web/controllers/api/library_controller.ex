defmodule PlexRequestWeb.Api.LibraryController do
  use PlexRequestWeb, :controller

  alias PlexRequest.Plex
  alias PlexRequest.Plex.Library

  action_fallback PlexRequestWeb.FallbackController

  def index(conn, _params) do
    library = Plex.list_library()
    render(conn, :index, library: library)
  end

  def create(conn, %{"library" => library_params}) do
    with {:ok, %Library{} = library} <- Plex.create_library(library_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/api/library/#{library}")
      |> render(:show, library: library)
    end
  end

  def show(conn, %{"id" => id}) do
    library = Plex.get_library!(id)
    render(conn, :show, library: library)
  end

  def update(conn, %{"id" => id, "library" => library_params}) do
    library = Plex.get_library!(id)

    with {:ok, %Library{} = library} <- Plex.update_library(library, library_params) do
      render(conn, :show, library: library)
    end
  end

  def delete(conn, %{"id" => id}) do
    library = Plex.get_library!(id)

    with {:ok, %Library{}} <- Plex.delete_library(library) do
      send_resp(conn, :no_content, "")
    end
  end
end
