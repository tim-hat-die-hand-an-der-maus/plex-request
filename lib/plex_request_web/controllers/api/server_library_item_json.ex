defmodule PlexRequestWeb.Api.ServerLibraryItemJSON do
  alias PlexRequest.Plex.ServerLibraryItem

  @doc """
  Renders a list of server_library_item.
  """
  def index(%{server_library_item: server_library_item}) do
    %{data: for(server_library_item <- server_library_item, do: data(server_library_item))}
  end

  @doc """
  Renders a single server_library_item.
  """
  def show(%{server_library_item: server_library_item}) do
    %{data: data(server_library_item)}
  end

  defp data(%ServerLibraryItem{} = server_library_item) do
    %{
      id: server_library_item.id,
      name: server_library_item.name,
      year: server_library_item.year,
      rating_key: server_library_item.rating_key,
      server_library_id: server_library_item.server_library_id,
    }
  end
end
