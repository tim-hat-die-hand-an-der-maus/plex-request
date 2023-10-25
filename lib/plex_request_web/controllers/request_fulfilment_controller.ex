defmodule PlexRequestWeb.RequestFulfilmentController do
  use PlexRequestWeb, :controller

  alias PlexRequest.Plex
  alias PlexRequest.Requests
  alias PlexRequest.Requests.RequestFulfilment

  def index(conn, _params) do
    request_fulfilment = Requests.list_request_fulfilment()
    render(conn, :index, request_fulfilment_collection: request_fulfilment)
  end

  def new(conn, _params) do
    changeset = Requests.change_request_fulfilment(%RequestFulfilment{})
    request = Requests.list_request()
    server_library_item = Plex.list_server_library_item()

    render(conn, :new, changeset: changeset, request_collection: request, server_library_item_collection: server_library_item)
  end

  def create(conn, %{"request_fulfilment" => request_fulfilment_params}) do
    case Requests.create_request_fulfilment(request_fulfilment_params) do
      {:ok, request_fulfilment} ->
        conn
        |> put_flash(:info, "Request fulfilment created successfully.")
        |> redirect(to: ~p"/request_fulfilment/#{request_fulfilment}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    request_fulfilment = Requests.get_request_fulfilment!(id)

    render(conn, :show, request_fulfilment: request_fulfilment)
  end

  def edit(conn, %{"id" => id}) do
    request_fulfilment = Requests.get_request_fulfilment!(id)
    changeset = Requests.change_request_fulfilment(request_fulfilment)
    request = Requests.list_request()
    server_library_item = PlexRequest.Plex.list_server_library_item()

    render(conn, :edit, request_fulfilment: request_fulfilment, changeset: changeset, request_collection: request, server_library_item_collection: server_library_item)
  end

  def update(conn, %{"id" => id, "request_fulfilment" => request_fulfilment_params}) do
    request_fulfilment = Requests.get_request_fulfilment!(id)

    case Requests.update_request_fulfilment(request_fulfilment, request_fulfilment_params) do
      {:ok, request_fulfilment} ->
        conn
        |> put_flash(:info, "Request fulfilment updated successfully.")
        |> redirect(to: ~p"/request_fulfilment/#{request_fulfilment}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, request_fulfilment: request_fulfilment, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    request_fulfilment = Requests.get_request_fulfilment!(id)
    {:ok, _request_fulfilment} = Requests.delete_request_fulfilment(request_fulfilment)

    conn
    |> put_flash(:info, "Request fulfilment deleted successfully.")
    |> redirect(to: ~p"/request_fulfilment")
  end
end
