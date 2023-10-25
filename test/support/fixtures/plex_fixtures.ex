defmodule PlexRequest.PlexFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PlexRequest.Plex` context.
  """

  @doc """
  Generate a server.
  """
  def server_fixture(attrs \\ %{}) do
    {:ok, server} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> PlexRequest.Plex.create_server()

    server
  end

  @doc """
  Generate a library.
  """
  def library_fixture(attrs \\ %{}) do
    {:ok, library} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> PlexRequest.Plex.create_library()

    library
  end

  @doc """
  Generate a server_library.
  """
  def server_library_fixture(attrs \\ %{}) do
    {:ok, server_library} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> PlexRequest.Plex.create_server_library()

    server_library
  end
end
