defmodule PlexRequestWeb.RequestController do
  use PlexRequestWeb, :controller

  alias PlexRequest.Requests
  alias PlexRequest.Requests.Request

  def index(conn, _params) do
    request = Requests.list_request()
    render(conn, :index, request_collection: request)
  end

  def new(conn, _params) do
    changeset = Requests.change_request(%Request{})
    source = Requests.list_source()
    render(conn, :new, changeset: changeset, source_collection: source)
  end

  def create(conn, %{"request" => request_params}) do
    case Requests.create_request(request_params) do
      {:ok, request} ->
        conn
        |> put_flash(:info, "Request created successfully.")
        |> redirect(to: ~p"/request/#{request}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    request = Requests.get_request!(id)
    render(conn, :show, request: request)
  end

  def edit(conn, %{"id" => id}) do
    request = Requests.get_request!(id)
    changeset = Requests.change_request(request)
    source = Requests.list_source()
    render(conn, :edit, request: request, changeset: changeset, source_collection: source)
  end

  def update(conn, %{"id" => id, "request" => request_params}) do
    request = Requests.get_request!(id)

    case Requests.update_request(request, request_params) do
      {:ok, request} ->
        conn
        |> put_flash(:info, "Request updated successfully.")
        |> redirect(to: ~p"/request/#{request}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, request: request, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    request = Requests.get_request!(id)
    {:ok, _request} = Requests.delete_request(request)

    conn
    |> put_flash(:info, "Request deleted successfully.")
    |> redirect(to: ~p"/request")
  end
end
