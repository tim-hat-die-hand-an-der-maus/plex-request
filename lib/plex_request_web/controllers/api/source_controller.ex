defmodule PlexRequestWeb.Api.SourceController do
  use PlexRequestWeb, :controller

  alias PlexRequest.Requests
  alias PlexRequest.Requests.Source

  action_fallback PlexRequestWeb.FallbackController

  def index(conn, _params) do
    source = Requests.list_source()
    render(conn, :index, source: source)
  end

  def create(conn, %{"source" => source_params}) do
    with {:ok, %Source{} = source} <- Requests.create_source(source_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/source/#{source}")
      |> render(:show, source: source)
    end
  end

  def show(conn, %{"id" => id}) do
    source = Requests.get_source!(id)
    render(conn, :show, source: source)
  end

  def update(conn, %{"id" => id, "source" => source_params}) do
    source = Requests.get_source!(id)

    with {:ok, %Source{} = source} <- Requests.update_source(source, source_params) do
      render(conn, :show, source: source)
    end
  end

  def delete(conn, %{"id" => id}) do
    source = Requests.get_source!(id)

    with {:ok, %Source{}} <- Requests.delete_source(source) do
      send_resp(conn, :no_content, "")
    end
  end
end
