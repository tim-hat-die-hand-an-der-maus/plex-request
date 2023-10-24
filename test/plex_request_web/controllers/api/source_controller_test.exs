defmodule PlexRequestWeb.Api.SourceControllerTest do
  use PlexRequestWeb.ConnCase

  import PlexRequest.RequestsFixtures

  alias PlexRequest.Requests.Source

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
    test "lists all source", %{conn: conn} do
      conn = get(conn, ~p"/api/source")
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create source" do
    test "renders source when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/api/source", source: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, ~p"/api/source/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/api/source", source: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update source" do
    setup [:create_source]

    test "renders source when data is valid", %{conn: conn, source: %Source{id: id} = source} do
      conn = put(conn, ~p"/api/source/#{source}", source: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, ~p"/api/source/#{id}")

      assert %{
               "id" => ^id,
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, source: source} do
      conn = put(conn, ~p"/api/source/#{source}", source: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete source" do
    setup [:create_source]

    test "deletes chosen source", %{conn: conn, source: source} do
      conn = delete(conn, ~p"/api/source/#{source}")
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, ~p"/api/source/#{source}")
      end
    end
  end

  defp create_source(_) do
    source = source_fixture()
    %{source: source}
  end
end
