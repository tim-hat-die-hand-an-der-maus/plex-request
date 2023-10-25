defmodule PlexRequestWeb.Api.ServerLibraryJSON do
  alias PlexRequest.Plex.ServerLibrary

  @doc """
  Renders a list of server_library.
  """
  def index(%{server_library: server_library}) do
    %{data: for(server_library <- server_library, do: data(server_library))}
  end

  @doc """
  Renders a single server_library.
  """
  def show(%{server_library: server_library}) do
    %{data: data(server_library)}
  end

  defp data(%ServerLibrary{} = server_library) do
    %{
      id: server_library.id,
      name: server_library.name,
      server_id: server_library.server_id,
      library_id: server_library.library_id,
    }
  end
end
