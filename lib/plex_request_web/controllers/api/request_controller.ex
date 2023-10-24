defmodule PlexRequestWeb.Api.RequestController do
  use PlexRequestWeb, :controller

  alias PlexRequest.Requests
  alias PlexRequest.Requests.Request

  action_fallback PlexRequestWeb.FallbackController

  def index(conn, _params) do
    request = Requests.list_request()
    render(conn, :index, request: request)
  end

  def create(conn, %{"request" => request_params}) do
    with {:ok, %Request{} = request} <- Requests.create_request(request_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/request/#{request}")
      |> render(:show, request: request)
    end
  end

  def show(conn, %{"id" => id}) do
    request = Requests.get_request!(id)
    render(conn, :show, request: request)
  end

  def update(conn, %{"id" => id, "request" => request_params}) do
    request = Requests.get_request!(id)

    with {:ok, %Request{} = request} <- Requests.update_request(request, request_params) do
      render(conn, :show, request: request)
    end
  end

  def delete(conn, %{"id" => id}) do
    request = Requests.get_request!(id)

    with {:ok, %Request{}} <- Requests.delete_request(request) do
      send_resp(conn, :no_content, "")
    end
  end
end
