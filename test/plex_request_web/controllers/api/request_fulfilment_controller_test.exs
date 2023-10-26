defmodule PlexRequestWeb.Api.RequestFulfilmentControllerTest do
  use PlexRequestWeb.ConnCase

  import PlexRequest.RequestsFixtures

  alias PlexRequest.Requests.RequestFulfilment

  @create_attrs %{

  }
  @update_attrs %{

  }
  @invalid_attrs %{}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all request_fulfilment", %{conn: conn} do
      conn = get(conn, ~p"/api/request_fulfilment")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create request_fulfilment" do
    test "renders request_fulfilment when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/request_fulfilment", request_fulfilment: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/request_fulfilment/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/request_fulfilment", request_fulfilment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update request_fulfilment" do
    setup [:create_request_fulfilment]

    test "renders request_fulfilment when data is valid", %{conn: conn, request_fulfilment: %RequestFulfilment{id: id} = request_fulfilment} do
      conn = put(conn, ~p"/api/request_fulfilment/#{request_fulfilment}", request_fulfilment: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/request_fulfilment/#{id}")

      assert %{
               "id" => ^id
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, request_fulfilment: request_fulfilment} do
      conn = put(conn, ~p"/api/request_fulfilment/#{request_fulfilment}", request_fulfilment: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete request_fulfilment" do
    setup [:create_request_fulfilment]

    test "deletes chosen request_fulfilment", %{conn: conn, request_fulfilment: request_fulfilment} do
      conn = delete(conn, ~p"/api/request_fulfilment/#{request_fulfilment}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/request_fulfilment/#{request_fulfilment}")
      end
    end
  end

  defp create_request_fulfilment(_) do
    request_fulfilment = request_fulfilment_fixture()
    %{request_fulfilment: request_fulfilment}
  end
end
