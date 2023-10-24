defmodule PlexRequestWeb.RequestControllerTest do
  use PlexRequestWeb.ConnCase

  import PlexRequest.RequestsFixtures

  @create_attrs %{upstream_id: "some upstream_id"}
  @update_attrs %{upstream_id: "some updated upstream_id"}
  @invalid_attrs %{upstream_id: nil}

  describe "index" do
    test "lists all request", %{conn: conn} do
      conn = get(conn, ~p"/request")
      assert html_response(conn, 200) =~ "Listing Request"
    end
  end

  describe "new request" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/request/new")
      assert html_response(conn, 200) =~ "New Request"
    end
  end

  describe "create request" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/request", request: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/request/#{id}"

      conn = get(conn, ~p"/request/#{id}")
      assert html_response(conn, 200) =~ "Request #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/request", request: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Request"
    end
  end

  describe "edit request" do
    setup [:create_request]

    test "renders form for editing chosen request", %{conn: conn, request: request} do
      conn = get(conn, ~p"/request/#{request}/edit")
      assert html_response(conn, 200) =~ "Edit Request"
    end
  end

  describe "update request" do
    setup [:create_request]

    test "redirects when data is valid", %{conn: conn, request: request} do
      conn = put(conn, ~p"/request/#{request}", request: @update_attrs)
      assert redirected_to(conn) == ~p"/request/#{request}"

      conn = get(conn, ~p"/request/#{request}")
      assert html_response(conn, 200) =~ "some updated upstream_id"
    end

    test "renders errors when data is invalid", %{conn: conn, request: request} do
      conn = put(conn, ~p"/request/#{request}", request: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Request"
    end
  end

  describe "delete request" do
    setup [:create_request]

    test "deletes chosen request", %{conn: conn, request: request} do
      conn = delete(conn, ~p"/request/#{request}")
      assert redirected_to(conn) == ~p"/request"

      assert_error_sent 404, fn ->
        get(conn, ~p"/request/#{request}")
      end
    end
  end

  defp create_request(_) do
    request = request_fixture()
    %{request: request}
  end
end
