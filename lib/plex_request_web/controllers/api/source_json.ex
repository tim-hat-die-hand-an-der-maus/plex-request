defmodule PlexRequestWeb.Api.SourceJSON do
  alias PlexRequest.Requests.Source

  @doc """
  Renders a list of source.
  """
  def index(%{source: source}) do
    %{data: for(source <- source, do: data(source))}
  end

  @doc """
  Renders a single source.
  """
  def show(%{source: source}) do
    %{data: data(source)}
  end

  def data(%Source{} = source) do
    %{
      id: source.id,
      name: source.name
    }
  end
end
