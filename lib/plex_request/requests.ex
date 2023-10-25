defmodule PlexRequest.Requests do
  @moduledoc """
  The Requests context.
  """

  import Ecto.Query, warn: false
  alias PlexRequest.Repo

  alias PlexRequest.Requests.Request

  @doc """
  Returns the list of request.

  ## Examples

      iex> list_request()
      [%Request{}, ...]

  """
  def list_request do
    Request
    |> Repo.all()
    |> Repo.preload(:source)
  end

  @doc """
  Gets a single request.

  Raises `Ecto.NoResultsError` if the Request does not exist.

  ## Examples

      iex> get_request!(123)
      %Request{}

      iex> get_request!(456)
      ** (Ecto.NoResultsError)

  """
  def get_request!(id) do
    Request
    |> Repo.get!(id)
    |> Repo.preload(:source)
  end

  @doc """
  Creates a request.

  ## Examples

      iex> create_request(%{field: value})
      {:ok, %Request{}}

      iex> create_request(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_request(attrs \\ %{}) do
    %Request{}
    |> Request.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a request.

  ## Examples

      iex> update_request(request, %{field: new_value})
      {:ok, %Request{}}

      iex> update_request(request, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_request(%Request{} = request, attrs) do
    request
    |> Request.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a request.

  ## Examples

      iex> delete_request(request)
      {:ok, %Request{}}

      iex> delete_request(request)
      {:error, %Ecto.Changeset{}}

  """
  def delete_request(%Request{} = request) do
    Repo.delete(request)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking request changes.

  ## Examples

      iex> change_request(request)
      %Ecto.Changeset{data: %Request{}}

  """
  def change_request(%Request{} = request, attrs \\ %{}) do
    Request.changeset(request, attrs)
  end

  alias PlexRequest.Requests.Source

  @doc """
  Returns the list of source.

  ## Examples

      iex> list_source()
      [%Source{}, ...]

  """
  def list_source do
    Repo.all(Source)
  end

  @doc """
  Gets a single source.

  Raises `Ecto.NoResultsError` if the Source does not exist.

  ## Examples

      iex> get_source!(123)
      %Source{}

      iex> get_source!(456)
      ** (Ecto.NoResultsError)

  """
  def get_source!(id), do: Repo.get!(Source, id)

  @doc """
  Creates a source.

  ## Examples

      iex> create_source(%{field: value})
      {:ok, %Source{}}

      iex> create_source(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_source(attrs \\ %{}) do
    %Source{}
    |> Source.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a source.

  ## Examples

      iex> update_source(source, %{field: new_value})
      {:ok, %Source{}}

      iex> update_source(source, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_source(%Source{} = source, attrs) do
    source
    |> Source.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a source.

  ## Examples

      iex> delete_source(source)
      {:ok, %Source{}}

      iex> delete_source(source)
      {:error, %Ecto.Changeset{}}

  """
  def delete_source(%Source{} = source) do
    Repo.delete(source)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking source changes.

  ## Examples

      iex> change_source(source)
      %Ecto.Changeset{data: %Source{}}

  """
  def change_source(%Source{} = source, attrs \\ %{}) do
    Source.changeset(source, attrs)
  end

  alias PlexRequest.Requests.RequestFulfilment

  @doc """
  Returns the list of request_fulfilment.

  ## Examples

      iex> list_request_fulfilment()
      [%RequestFulfilment{}, ...]

  """
  def list_request_fulfilment do
    Repo.all(RequestFulfilment)
    |> Repo.preload([:request, :server_library_item])
  end

  @doc """
  Gets a single request_fulfilment.

  Raises `Ecto.NoResultsError` if the Request fulfilment does not exist.

  ## Examples

      iex> get_request_fulfilment!(123)
      %RequestFulfilment{}

      iex> get_request_fulfilment!(456)
      ** (Ecto.NoResultsError)

  """
  def get_request_fulfilment!(id) do
    Repo.get!(RequestFulfilment, id)
    |> Repo.preload([:request, :server_library_item])
  end

  @doc """
  Creates a request_fulfilment.

  ## Examples

      iex> create_request_fulfilment(%{field: value})
      {:ok, %RequestFulfilment{}}

      iex> create_request_fulfilment(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_request_fulfilment(attrs \\ %{}) do
    %RequestFulfilment{}
    |> RequestFulfilment.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a request_fulfilment.

  ## Examples

      iex> update_request_fulfilment(request_fulfilment, %{field: new_value})
      {:ok, %RequestFulfilment{}}

      iex> update_request_fulfilment(request_fulfilment, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_request_fulfilment(%RequestFulfilment{} = request_fulfilment, attrs) do
    request_fulfilment
    |> RequestFulfilment.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a request_fulfilment.

  ## Examples

      iex> delete_request_fulfilment(request_fulfilment)
      {:ok, %RequestFulfilment{}}

      iex> delete_request_fulfilment(request_fulfilment)
      {:error, %Ecto.Changeset{}}

  """
  def delete_request_fulfilment(%RequestFulfilment{} = request_fulfilment) do
    Repo.delete(request_fulfilment)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking request_fulfilment changes.

  ## Examples

      iex> change_request_fulfilment(request_fulfilment)
      %Ecto.Changeset{data: %RequestFulfilment{}}

  """
  def change_request_fulfilment(%RequestFulfilment{} = request_fulfilment, attrs \\ %{}) do
    RequestFulfilment.changeset(request_fulfilment, attrs)
  end
end
