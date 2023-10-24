defmodule PlexRequestWeb.Api.RequestJSON do
  alias PlexRequest.Requests.Request
  alias PlexRequestWeb.Api

  @doc """
  Renders a list of request.
  """
  def index(%{request: request}) do
    %{data: for(request <- request, do: data(request))}
  end

  @doc """
  Renders a single request.
  """
  def show(%{request: request}) do
    %{data: data(request)}
  end

  defp data(%Request{} = request) do
    %{
      id: request.id,
      upstream_id: request.upstream_id,
      source_id: request.source_id,
    }
  end
end
