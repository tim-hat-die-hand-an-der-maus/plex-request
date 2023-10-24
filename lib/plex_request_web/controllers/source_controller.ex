defmodule PlexRequestWeb.SourceController do
  use PlexRequestWeb, :controller

  alias PlexRequest.Requests
  alias PlexRequest.Requests.Source

  def index(conn, _params) do
    source = Requests.list_source()
    render(conn, :index, source_collection: source)
  end

  def new(conn, _params) do
    changeset = Requests.change_source(%Source{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"source" => source_params}) do
    case Requests.create_source(source_params) do
      {:ok, source} ->
        conn
        |> put_flash(:info, "Source created successfully.")
        |> redirect(to: ~p"/source/#{source}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    source = Requests.get_source!(id)
    render(conn, :show, source: source)
  end

  def edit(conn, %{"id" => id}) do
    source = Requests.get_source!(id)
    changeset = Requests.change_source(source)
    render(conn, :edit, source: source, changeset: changeset)
  end

  def update(conn, %{"id" => id, "source" => source_params}) do
    source = Requests.get_source!(id)

    case Requests.update_source(source, source_params) do
      {:ok, source} ->
        conn
        |> put_flash(:info, "Source updated successfully.")
        |> redirect(to: ~p"/source/#{source}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, source: source, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    source = Requests.get_source!(id)
    {:ok, _source} = Requests.delete_source(source)

    conn
    |> put_flash(:info, "Source deleted successfully.")
    |> redirect(to: ~p"/source")
  end
end
