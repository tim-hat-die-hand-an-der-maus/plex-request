defmodule PlexRequest.Plex do
  @moduledoc """
  The Plex context.
  """

  import Ecto.Query, warn: false
  alias PlexRequest.Repo

  alias PlexRequest.Plex.Server

  @doc """
  Returns the list of server.

  ## Examples

      iex> list_server()
      [%Server{}, ...]

  """
  def list_server do
    Repo.all(Server)
  end

  @doc """
  Gets a single server.

  Raises `Ecto.NoResultsError` if the Server does not exist.

  ## Examples

      iex> get_server!(123)
      %Server{}

      iex> get_server!(456)
      ** (Ecto.NoResultsError)

  """
  def get_server!(id), do: Repo.get!(Server, id)

  @doc """
  Creates a server.

  ## Examples

      iex> create_server(%{field: value})
      {:ok, %Server{}}

      iex> create_server(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_server(attrs \\ %{}) do
    %Server{}
    |> Server.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a server.

  ## Examples

      iex> update_server(server, %{field: new_value})
      {:ok, %Server{}}

      iex> update_server(server, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_server(%Server{} = server, attrs) do
    server
    |> Server.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a server.

  ## Examples

      iex> delete_server(server)
      {:ok, %Server{}}

      iex> delete_server(server)
      {:error, %Ecto.Changeset{}}

  """
  def delete_server(%Server{} = server) do
    Repo.delete(server)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking server changes.

  ## Examples

      iex> change_server(server)
      %Ecto.Changeset{data: %Server{}}

  """
  def change_server(%Server{} = server, attrs \\ %{}) do
    Server.changeset(server, attrs)
  end

  alias PlexRequest.Plex.Library

  @doc """
  Returns the list of library.

  ## Examples

      iex> list_library()
      [%Library{}, ...]

  """
  def list_library do
    Repo.all(Library)
  end

  @doc """
  Gets a single library.

  Raises `Ecto.NoResultsError` if the Library does not exist.

  ## Examples

      iex> get_library!(123)
      %Library{}

      iex> get_library!(456)
      ** (Ecto.NoResultsError)

  """
  def get_library!(id), do: Repo.get!(Library, id)

  @doc """
  Creates a library.

  ## Examples

      iex> create_library(%{field: value})
      {:ok, %Library{}}

      iex> create_library(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_library(attrs \\ %{}) do
    %Library{}
    |> Library.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a library.

  ## Examples

      iex> update_library(library, %{field: new_value})
      {:ok, %Library{}}

      iex> update_library(library, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_library(%Library{} = library, attrs) do
    library
    |> Library.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a library.

  ## Examples

      iex> delete_library(library)
      {:ok, %Library{}}

      iex> delete_library(library)
      {:error, %Ecto.Changeset{}}

  """
  def delete_library(%Library{} = library) do
    Repo.delete(library)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking library changes.

  ## Examples

      iex> change_library(library)
      %Ecto.Changeset{data: %Library{}}

  """
  def change_library(%Library{} = library, attrs \\ %{}) do
    Library.changeset(library, attrs)
  end

  alias PlexRequest.Plex.ServerLibrary

  @doc """
  Returns the list of server_library.

  ## Examples

      iex> list_server_library()
      [%ServerLibrary{}, ...]

  """
  def list_server_library do
    Repo.all(ServerLibrary)
    |> Repo.preload([:server, :library])
  end

  @doc """
  Gets a single server_library.

  Raises `Ecto.NoResultsError` if the Server library does not exist.

  ## Examples

      iex> get_server_library!(123)
      %ServerLibrary{}

      iex> get_server_library!(456)
      ** (Ecto.NoResultsError)

  """
  def get_server_library!(id) do
    Repo.get!(ServerLibrary, id)
    |> Repo.preload([:server, :library])
  end

  @doc """
  Creates a server_library.

  ## Examples

      iex> create_server_library(%{field: value})
      {:ok, %ServerLibrary{}}

      iex> create_server_library(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_server_library(attrs \\ %{}) do
    %ServerLibrary{}
    |> ServerLibrary.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a server_library.

  ## Examples

      iex> update_server_library(server_library, %{field: new_value})
      {:ok, %ServerLibrary{}}

      iex> update_server_library(server_library, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_server_library(%ServerLibrary{} = server_library, attrs) do
    server_library
    |> ServerLibrary.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a server_library.

  ## Examples

      iex> delete_server_library(server_library)
      {:ok, %ServerLibrary{}}

      iex> delete_server_library(server_library)
      {:error, %Ecto.Changeset{}}

  """
  def delete_server_library(%ServerLibrary{} = server_library) do
    Repo.delete(server_library)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking server_library changes.

  ## Examples

      iex> change_server_library(server_library)
      %Ecto.Changeset{data: %ServerLibrary{}}

  """
  def change_server_library(%ServerLibrary{} = server_library, attrs \\ %{}) do
    ServerLibrary.changeset(server_library, attrs)
  end
end
