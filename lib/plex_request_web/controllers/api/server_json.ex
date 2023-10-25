defmodule PlexRequestWeb.Api.ServerJSON do
  alias PlexRequest.Plex.Server

  @doc """
  Renders a list of server.
  """
  def index(%{server: server}) do
    %{data: for(server <- server, do: data(server))}
  end

  @doc """
  Renders a single server.
  """
  def show(%{server: server}) do
    %{data: data(server)}
  end

  defp data(%Server{} = server) do
    %{
      id: server.id,
      name: server.name
    }
  end
end
