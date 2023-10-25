defmodule PlexRequestWeb.Api.RequestFulfilmentJSON do
  alias PlexRequest.Requests.RequestFulfilment

  @doc """
  Renders a list of request_fulfilment.
  """
  def index(%{request_fulfilment: request_fulfilment}) do
    %{data: for(request_fulfilment <- request_fulfilment, do: data(request_fulfilment))}
  end

  @doc """
  Renders a single request_fulfilment.
  """
  def show(%{request_fulfilment: request_fulfilment}) do
    %{data: data(request_fulfilment)}
  end

  defp data(%RequestFulfilment{} = request_fulfilment) do
    %{
      id: request_fulfilment.id,
      request_id: request_fulfilment.request_id,
      server_library_item_id: request_fulfilment.server_library_item_id,
    }
  end
end
