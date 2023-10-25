defmodule PlexRequestWeb.Api.RequestFulfilmentController do
  use PlexRequestWeb, :controller

  alias PlexRequest.Requests
  alias PlexRequest.Requests.RequestFulfilment

  action_fallback PlexRequestWeb.FallbackController

  def index(conn, _params) do
    request_fulfilment = Requests.list_request_fulfilment()
    render(conn, :index, request_fulfilment: request_fulfilment)
  end

  def create(conn, %{"request_fulfilment" => request_fulfilment_params}) do
    with {:ok, %RequestFulfilment{} = request_fulfilment} <- Requests.create_request_fulfilment(request_fulfilment_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/request_fulfilment/#{request_fulfilment}")
      |> render(:show, request_fulfilment: request_fulfilment)
    end
  end

  def show(conn, %{"id" => id}) do
    request_fulfilment = Requests.get_request_fulfilment!(id)
    render(conn, :show, request_fulfilment: request_fulfilment)
  end

  def update(conn, %{"id" => id, "request_fulfilment" => request_fulfilment_params}) do
    request_fulfilment = Requests.get_request_fulfilment!(id)

    with {:ok, %RequestFulfilment{} = request_fulfilment} <- Requests.update_request_fulfilment(request_fulfilment, request_fulfilment_params) do
      render(conn, :show, request_fulfilment: request_fulfilment)
    end
  end

  def delete(conn, %{"id" => id}) do
    request_fulfilment = Requests.get_request_fulfilment!(id)

    with {:ok, %RequestFulfilment{}} <- Requests.delete_request_fulfilment(request_fulfilment) do
      send_resp(conn, :no_content, "")
    end
  end
end
