defmodule PlexRequestWeb.Api.LibraryJSON do
  alias PlexRequest.Plex.Library

  @doc """
  Renders a list of library.
  """
  def index(%{library: library}) do
    %{data: for(library <- library, do: data(library))}
  end

  @doc """
  Renders a single library.
  """
  def show(%{library: library}) do
    %{data: data(library)}
  end

  defp data(%Library{} = library) do
    %{
      id: library.id,
      name: library.name
    }
  end
end
