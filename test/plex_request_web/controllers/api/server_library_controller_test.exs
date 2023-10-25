defmodule PlexRequestWeb.Api.ServerLibraryControllerTest do
  use PlexRequestWeb.ConnCase

  import PlexRequest.PlexFixtures

  alias PlexRequest.Plex.ServerLibrary

  @create_attrs %{
    name: "some name"
  }
  @update_attrs %{
    name: "some updated name"
  }
  @invalid_attrs %{name: nil}

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all server_library", %{conn: conn} do
      conn = get(conn, ~p"/api/api/server_library")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create server_library" do
    test "renders server_library when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/api/server_library", server_library: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/api/server_library/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/api/server_library", server_library: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update server_library" do
    setup [:create_server_library]

    test "renders server_library when data is valid", %{conn: conn, server_library: %ServerLibrary{id: id} = server_library} do
      conn = put(conn, ~p"/api/api/server_library/#{server_library}", server_library: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/api/server_library/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, server_library: server_library} do
      conn = put(conn, ~p"/api/api/server_library/#{server_library}", server_library: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete server_library" do
    setup [:create_server_library]

    test "deletes chosen server_library", %{conn: conn, server_library: server_library} do
      conn = delete(conn, ~p"/api/api/server_library/#{server_library}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/api/server_library/#{server_library}")
      end
    end
  end

  defp create_server_library(_) do
    server_library = server_library_fixture()
    %{server_library: server_library}
  end
end
