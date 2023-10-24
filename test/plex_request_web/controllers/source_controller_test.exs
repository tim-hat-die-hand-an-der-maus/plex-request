defmodule PlexRequestWeb.SourceControllerTest do
  use PlexRequestWeb.ConnCase

  import PlexRequest.RequestsFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all source", %{conn: conn} do
      conn = get(conn, ~p"/source")
      assert html_response(conn, 200) =~ "Listing Source"
    end
  end

  describe "new source" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/source/new")
      assert html_response(conn, 200) =~ "New Source"
    end
  end

  describe "create source" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/source", source: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/source/#{id}"

      conn = get(conn, ~p"/source/#{id}")
      assert html_response(conn, 200) =~ "Source #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/source", source: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Source"
    end
  end

  describe "edit source" do
    setup [:create_source]

    test "renders form for editing chosen source", %{conn: conn, source: source} do
      conn = get(conn, ~p"/source/#{source}/edit")
      assert html_response(conn, 200) =~ "Edit Source"
    end
  end

  describe "update source" do
    setup [:create_source]

    test "redirects when data is valid", %{conn: conn, source: source} do
      conn = put(conn, ~p"/source/#{source}", source: @update_attrs)
      assert redirected_to(conn) == ~p"/source/#{source}"

      conn = get(conn, ~p"/source/#{source}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, source: source} do
      conn = put(conn, ~p"/source/#{source}", source: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Source"
    end
  end

  describe "delete source" do
    setup [:create_source]

    test "deletes chosen source", %{conn: conn, source: source} do
      conn = delete(conn, ~p"/source/#{source}")
      assert redirected_to(conn) == ~p"/source"

      assert_error_sent 404, fn ->
        get(conn, ~p"/source/#{source}")
      end
    end
  end

  defp create_source(_) do
    source = source_fixture()
    %{source: source}
  end
end
