defmodule PlexRequestWeb.LibraryControllerTest do
  use PlexRequestWeb.ConnCase

  import PlexRequest.PlexFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all library", %{conn: conn} do
      conn = get(conn, ~p"/library")
      assert html_response(conn, 200) =~ "Listing Library"
    end
  end

  describe "new library" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/library/new")
      assert html_response(conn, 200) =~ "New Library"
    end
  end

  describe "create library" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/library", library: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/library/#{id}"

      conn = get(conn, ~p"/library/#{id}")
      assert html_response(conn, 200) =~ "Library #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/library", library: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Library"
    end
  end

  describe "edit library" do
    setup [:create_library]

    test "renders form for editing chosen library", %{conn: conn, library: library} do
      conn = get(conn, ~p"/library/#{library}/edit")
      assert html_response(conn, 200) =~ "Edit Library"
    end
  end

  describe "update library" do
    setup [:create_library]

    test "redirects when data is valid", %{conn: conn, library: library} do
      conn = put(conn, ~p"/library/#{library}", library: @update_attrs)
      assert redirected_to(conn) == ~p"/library/#{library}"

      conn = get(conn, ~p"/library/#{library}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, library: library} do
      conn = put(conn, ~p"/library/#{library}", library: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Library"
    end
  end

  describe "delete library" do
    setup [:create_library]

    test "deletes chosen library", %{conn: conn, library: library} do
      conn = delete(conn, ~p"/library/#{library}")
      assert redirected_to(conn) == ~p"/library"

      assert_error_sent 404, fn ->
        get(conn, ~p"/library/#{library}")
      end
    end
  end

  defp create_library(_) do
    library = library_fixture()
    %{library: library}
  end
end
