defmodule PlexRequestWeb.ServerControllerTest do
  use PlexRequestWeb.ConnCase

  import PlexRequest.PlexFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all server", %{conn: conn} do
      conn = get(conn, ~p"/server")
      assert html_response(conn, 200) =~ "Listing Server"
    end
  end

  describe "new server" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/server/new")
      assert html_response(conn, 200) =~ "New Server"
    end
  end

  describe "create server" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/server", server: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/server/#{id}"

      conn = get(conn, ~p"/server/#{id}")
      assert html_response(conn, 200) =~ "Server #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/server", server: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Server"
    end
  end

  describe "edit server" do
    setup [:create_server]

    test "renders form for editing chosen server", %{conn: conn, server: server} do
      conn = get(conn, ~p"/server/#{server}/edit")
      assert html_response(conn, 200) =~ "Edit Server"
    end
  end

  describe "update server" do
    setup [:create_server]

    test "redirects when data is valid", %{conn: conn, server: server} do
      conn = put(conn, ~p"/server/#{server}", server: @update_attrs)
      assert redirected_to(conn) == ~p"/server/#{server}"

      conn = get(conn, ~p"/server/#{server}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, server: server} do
      conn = put(conn, ~p"/server/#{server}", server: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Server"
    end
  end

  describe "delete server" do
    setup [:create_server]

    test "deletes chosen server", %{conn: conn, server: server} do
      conn = delete(conn, ~p"/server/#{server}")
      assert redirected_to(conn) == ~p"/server"

      assert_error_sent 404, fn ->
        get(conn, ~p"/server/#{server}")
      end
    end
  end

  defp create_server(_) do
    server = server_fixture()
    %{server: server}
  end
end
