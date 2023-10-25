defmodule PlexRequestWeb.ServerLibraryControllerTest do
  use PlexRequestWeb.ConnCase

  import PlexRequest.PlexFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all server_library", %{conn: conn} do
      conn = get(conn, ~p"/server_library")
      assert html_response(conn, 200) =~ "Listing Server library"
    end
  end

  describe "new server_library" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/server_library/new")
      assert html_response(conn, 200) =~ "New Server library"
    end
  end

  describe "create server_library" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/server_library", server_library: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/server_library/#{id}"

      conn = get(conn, ~p"/server_library/#{id}")
      assert html_response(conn, 200) =~ "Server library #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/server_library", server_library: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Server library"
    end
  end

  describe "edit server_library" do
    setup [:create_server_library]

    test "renders form for editing chosen server_library", %{conn: conn, server_library: server_library} do
      conn = get(conn, ~p"/server_library/#{server_library}/edit")
      assert html_response(conn, 200) =~ "Edit Server library"
    end
  end

  describe "update server_library" do
    setup [:create_server_library]

    test "redirects when data is valid", %{conn: conn, server_library: server_library} do
      conn = put(conn, ~p"/server_library/#{server_library}", server_library: @update_attrs)
      assert redirected_to(conn) == ~p"/server_library/#{server_library}"

      conn = get(conn, ~p"/server_library/#{server_library}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, server_library: server_library} do
      conn = put(conn, ~p"/server_library/#{server_library}", server_library: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Server library"
    end
  end

  describe "delete server_library" do
    setup [:create_server_library]

    test "deletes chosen server_library", %{conn: conn, server_library: server_library} do
      conn = delete(conn, ~p"/server_library/#{server_library}")
      assert redirected_to(conn) == ~p"/server_library"

      assert_error_sent 404, fn ->
        get(conn, ~p"/server_library/#{server_library}")
      end
    end
  end

  defp create_server_library(_) do
    server_library = server_library_fixture()
    %{server_library: server_library}
  end
end
