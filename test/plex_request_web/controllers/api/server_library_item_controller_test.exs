defmodule PlexRequestWeb.Api.ServerLibraryItemControllerTest do
  use PlexRequestWeb.ConnCase

  import PlexRequest.PlexFixtures

  alias PlexRequest.Plex.ServerLibraryItem

  @create_attrs %{
    name: "some name",
    year: 42,
    rating_key: 42
  }
  @update_attrs %{
    name: "some updated name",
    year: 43,
    rating_key: 43
  }
  @invalid_attrs %{name: nil, year: nil, rating_key: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all server_library_item", %{conn: conn} do
      conn = get(conn, ~p"/api/server_library_item")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create server_library_item" do
    test "renders server_library_item when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/server_library_item", server_library_item: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/server_library_item/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name",
               "rating_key" => 42,
               "year" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/server_library_item", server_library_item: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update server_library_item" do
    setup [:create_server_library_item]

    test "renders server_library_item when data is valid", %{conn: conn, server_library_item: %ServerLibraryItem{id: id} = server_library_item} do
      conn = put(conn, ~p"/api/server_library_item/#{server_library_item}", server_library_item: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/server_library_item/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name",
               "rating_key" => 43,
               "year" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, server_library_item: server_library_item} do
      conn = put(conn, ~p"/api/server_library_item/#{server_library_item}", server_library_item: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete server_library_item" do
    setup [:create_server_library_item]

    test "deletes chosen server_library_item", %{conn: conn, server_library_item: server_library_item} do
      conn = delete(conn, ~p"/api/server_library_item/#{server_library_item}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/server_library_item/#{server_library_item}")
      end
    end
  end

  defp create_server_library_item(_) do
    server_library_item = server_library_item_fixture()
    %{server_library_item: server_library_item}
  end
end
