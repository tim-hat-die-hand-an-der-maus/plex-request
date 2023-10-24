defmodule PlexRequest.RequestsTest do
  use PlexRequest.DataCase

  alias PlexRequest.Requests

  describe "request" do
    alias PlexRequest.Requests.Request

    import PlexRequest.RequestsFixtures

    @invalid_attrs %{upstream_id: nil}

    test "list_request/0 returns all request" do
      request = request_fixture()
      assert Requests.list_request() == [request]
    end

    test "get_request!/1 returns the request with given id" do
      request = request_fixture()
      assert Requests.get_request!(request.id) == request
    end

    test "create_request/1 with valid data creates a request" do
      valid_attrs = %{upstream_id: "some upstream_id"}

      assert {:ok, %Request{} = request} = Requests.create_request(valid_attrs)
      assert request.upstream_id == "some upstream_id"
    end

    test "create_request/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Requests.create_request(@invalid_attrs)
    end

    test "update_request/2 with valid data updates the request" do
      request = request_fixture()
      update_attrs = %{upstream_id: "some updated upstream_id"}

      assert {:ok, %Request{} = request} = Requests.update_request(request, update_attrs)
      assert request.upstream_id == "some updated upstream_id"
    end

    test "update_request/2 with invalid data returns error changeset" do
      request = request_fixture()
      assert {:error, %Ecto.Changeset{}} = Requests.update_request(request, @invalid_attrs)
      assert request == Requests.get_request!(request.id)
    end

    test "delete_request/1 deletes the request" do
      request = request_fixture()
      assert {:ok, %Request{}} = Requests.delete_request(request)
      assert_raise Ecto.NoResultsError, fn -> Requests.get_request!(request.id) end
    end

    test "change_request/1 returns a request changeset" do
      request = request_fixture()
      assert %Ecto.Changeset{} = Requests.change_request(request)
    end
  end

  describe "source" do
    alias PlexRequest.Requests.Source

    import PlexRequest.RequestsFixtures

    @invalid_attrs %{name: nil}

    test "list_source/0 returns all source" do
      source = source_fixture()
      assert Requests.list_source() == [source]
    end

    test "get_source!/1 returns the source with given id" do
      source = source_fixture()
      assert Requests.get_source!(source.id) == source
    end

    test "create_source/1 with valid data creates a source" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Source{} = source} = Requests.create_source(valid_attrs)
      assert source.name == "some name"
    end

    test "create_source/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Requests.create_source(@invalid_attrs)
    end

    test "update_source/2 with valid data updates the source" do
      source = source_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Source{} = source} = Requests.update_source(source, update_attrs)
      assert source.name == "some updated name"
    end

    test "update_source/2 with invalid data returns error changeset" do
      source = source_fixture()
      assert {:error, %Ecto.Changeset{}} = Requests.update_source(source, @invalid_attrs)
      assert source == Requests.get_source!(source.id)
    end

    test "delete_source/1 deletes the source" do
      source = source_fixture()
      assert {:ok, %Source{}} = Requests.delete_source(source)
      assert_raise Ecto.NoResultsError, fn -> Requests.get_source!(source.id) end
    end

    test "change_source/1 returns a source changeset" do
      source = source_fixture()
      assert %Ecto.Changeset{} = Requests.change_source(source)
    end
  end
end
