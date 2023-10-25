defmodule PlexRequestWeb.RequestFulfilmentControllerTest do
  use PlexRequestWeb.ConnCase

  import PlexRequest.RequestsFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  describe "index" do
    test "lists all request_fulfilment", %{conn: conn} do
      conn = get(conn, ~p"/request_fulfilment")
      assert html_response(conn, 200) =~ "Listing Request fulfilment"
    end
  end

  describe "new request_fulfilment" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/request_fulfilment/new")
      assert html_response(conn, 200) =~ "New Request fulfilment"
    end
  end

  describe "create request_fulfilment" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/request_fulfilment", request_fulfilment: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/request_fulfilment/#{id}"

      conn = get(conn, ~p"/request_fulfilment/#{id}")
      assert html_response(conn, 200) =~ "Request fulfilment #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/request_fulfilment", request_fulfilment: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Request fulfilment"
    end
  end

  describe "edit request_fulfilment" do
    setup [:create_request_fulfilment]

    test "renders form for editing chosen request_fulfilment", %{conn: conn, request_fulfilment: request_fulfilment} do
      conn = get(conn, ~p"/request_fulfilment/#{request_fulfilment}/edit")
      assert html_response(conn, 200) =~ "Edit Request fulfilment"
    end
  end

  describe "update request_fulfilment" do
    setup [:create_request_fulfilment]

    test "redirects when data is valid", %{conn: conn, request_fulfilment: request_fulfilment} do
      conn = put(conn, ~p"/request_fulfilment/#{request_fulfilment}", request_fulfilment: @update_attrs)
      assert redirected_to(conn) == ~p"/request_fulfilment/#{request_fulfilment}"

      conn = get(conn, ~p"/request_fulfilment/#{request_fulfilment}")
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, request_fulfilment: request_fulfilment} do
      conn = put(conn, ~p"/request_fulfilment/#{request_fulfilment}", request_fulfilment: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Request fulfilment"
    end
  end

  describe "delete request_fulfilment" do
    setup [:create_request_fulfilment]

    test "deletes chosen request_fulfilment", %{conn: conn, request_fulfilment: request_fulfilment} do
      conn = delete(conn, ~p"/request_fulfilment/#{request_fulfilment}")
      assert redirected_to(conn) == ~p"/request_fulfilment"

      assert_error_sent 404, fn ->
        get(conn, ~p"/request_fulfilment/#{request_fulfilment}")
      end
    end
  end

  defp create_request_fulfilment(_) do
    request_fulfilment = request_fulfilment_fixture()
    %{request_fulfilment: request_fulfilment}
  end
end
