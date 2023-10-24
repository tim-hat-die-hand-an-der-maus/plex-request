defmodule PlexRequestWeb.Api.RequestControllerTest do
  use PlexRequestWeb.ConnCase

  import PlexRequest.RequestsFixtures

  alias PlexRequest.Requests.Request

  @create_attrs %{
    upstream_id: "some upstream_id"
  }
  @update_attrs %{
    upstream_id: "some updated upstream_id"
  }
  @invalid_attrs %{upstream_id: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all request", %{conn: conn} do
      conn = get(conn, ~p"/api/request")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create request" do
    test "renders request when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/request", request: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/request/#{id}")

      assert %{
               "id" => ^id,
               "upstream_id" => "some upstream_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/request", request: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update request" do
    setup [:create_request]

    test "renders request when data is valid", %{conn: conn, request: %Request{id: id} = request} do
      conn = put(conn, ~p"/api/request/#{request}", request: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/request/#{id}")

      assert %{
               "id" => ^id,
               "upstream_id" => "some updated upstream_id"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, request: request} do
      conn = put(conn, ~p"/api/request/#{request}", request: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete request" do
    setup [:create_request]

    test "deletes chosen request", %{conn: conn, request: request} do
      conn = delete(conn, ~p"/api/request/#{request}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/request/#{request}")
      end
    end
  end

  defp create_request(_) do
    request = request_fixture()
    %{request: request}
  end
end
