defmodule PlexRequest.RequestsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PlexRequest.Requests` context.
  """

  @doc """
  Generate a request.
  """
  def request_fixture(attrs \\ %{}) do
    {:ok, request} =
      attrs
      |> Enum.into(%{
        upstream_id: "some upstream_id"
      })
      |> PlexRequest.Requests.create_request()

    request
  end

  @doc """
  Generate a source.
  """
  def source_fixture(attrs \\ %{}) do
    {:ok, source} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> PlexRequest.Requests.create_source()

    source
  end

  @doc """
  Generate a request_fulfilment.
  """
  def request_fulfilment_fixture(attrs \\ %{}) do
    {:ok, request_fulfilment} =
      attrs
      |> Enum.into(%{

      })
      |> PlexRequest.Requests.create_request_fulfilment()

    request_fulfilment
  end
end
