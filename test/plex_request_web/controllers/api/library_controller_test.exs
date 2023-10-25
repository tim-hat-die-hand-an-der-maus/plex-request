defmodule PlexRequestWeb.Api.LibraryControllerTest do
  use PlexRequestWeb.ConnCase

  import PlexRequest.PlexFixtures

  alias PlexRequest.Plex.Library

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
    test "lists all library", %{conn: conn} do
      conn = get(conn, ~p"/api/api/library")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create library" do
    test "renders library when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/api/library", library: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/api/library/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/api/library", library: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update library" do
    setup [:create_library]

    test "renders library when data is valid", %{conn: conn, library: %Library{id: id} = library} do
      conn = put(conn, ~p"/api/api/library/#{library}", library: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/api/library/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, library: library} do
      conn = put(conn, ~p"/api/api/library/#{library}", library: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete library" do
    setup [:create_library]

    test "deletes chosen library", %{conn: conn, library: library} do
      conn = delete(conn, ~p"/api/api/library/#{library}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/api/library/#{library}")
      end
    end
  end

  defp create_library(_) do
    library = library_fixture()
    %{library: library}
  end
end
