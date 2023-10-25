defmodule PlexRequestWeb.ServerLibraryItemControllerTest do
  use PlexRequestWeb.ConnCase

  import PlexRequest.PlexFixtures

  @create_attrs %{name: "some name", year: 42, rating_key: 42}
  @update_attrs %{name: "some updated name", year: 43, rating_key: 43}
  @invalid_attrs %{name: nil, year: nil, rating_key: nil}

  describe "index" do
    test "lists all server_library_item", %{conn: conn} do
      conn = get(conn, ~p"/server_library_item")
      assert html_response(conn, 200) =~ "Listing Server library item"
    end
  end

  describe "new server_library_item" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/server_library_item/new")
      assert html_response(conn, 200) =~ "New Server library item"
    end
  end

  describe "create server_library_item" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/server_library_item", server_library_item: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/server_library_item/#{id}"

      conn = get(conn, ~p"/server_library_item/#{id}")
      assert html_response(conn, 200) =~ "Server library item #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/server_library_item", server_library_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Server library item"
    end
  end

  describe "edit server_library_item" do
    setup [:create_server_library_item]

    test "renders form for editing chosen server_library_item", %{conn: conn, server_library_item: server_library_item} do
      conn = get(conn, ~p"/server_library_item/#{server_library_item}/edit")
      assert html_response(conn, 200) =~ "Edit Server library item"
    end
  end

  describe "update server_library_item" do
    setup [:create_server_library_item]

    test "redirects when data is valid", %{conn: conn, server_library_item: server_library_item} do
      conn = put(conn, ~p"/server_library_item/#{server_library_item}", server_library_item: @update_attrs)
      assert redirected_to(conn) == ~p"/server_library_item/#{server_library_item}"

      conn = get(conn, ~p"/server_library_item/#{server_library_item}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, server_library_item: server_library_item} do
      conn = put(conn, ~p"/server_library_item/#{server_library_item}", server_library_item: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Server library item"
    end
  end

  describe "delete server_library_item" do
    setup [:create_server_library_item]

    test "deletes chosen server_library_item", %{conn: conn, server_library_item: server_library_item} do
      conn = delete(conn, ~p"/server_library_item/#{server_library_item}")
      assert redirected_to(conn) == ~p"/server_library_item"

      assert_error_sent 404, fn ->
        get(conn, ~p"/server_library_item/#{server_library_item}")
      end
    end
  end

  defp create_server_library_item(_) do
    server_library_item = server_library_item_fixture()
    %{server_library_item: server_library_item}
  end
end
