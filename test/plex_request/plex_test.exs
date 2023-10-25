defmodule PlexRequest.PlexTest do
  use PlexRequest.DataCase

  alias PlexRequest.Plex

  describe "server" do
    alias PlexRequest.Plex.Server

    import PlexRequest.PlexFixtures

    @invalid_attrs %{name: nil}

    test "list_server/0 returns all server" do
      server = server_fixture()
      assert Plex.list_server() == [server]
    end

    test "get_server!/1 returns the server with given id" do
      server = server_fixture()
      assert Plex.get_server!(server.id) == server
    end

    test "create_server/1 with valid data creates a server" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Server{} = server} = Plex.create_server(valid_attrs)
      assert server.name == "some name"
    end

    test "create_server/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plex.create_server(@invalid_attrs)
    end

    test "update_server/2 with valid data updates the server" do
      server = server_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Server{} = server} = Plex.update_server(server, update_attrs)
      assert server.name == "some updated name"
    end

    test "update_server/2 with invalid data returns error changeset" do
      server = server_fixture()
      assert {:error, %Ecto.Changeset{}} = Plex.update_server(server, @invalid_attrs)
      assert server == Plex.get_server!(server.id)
    end

    test "delete_server/1 deletes the server" do
      server = server_fixture()
      assert {:ok, %Server{}} = Plex.delete_server(server)
      assert_raise Ecto.NoResultsError, fn -> Plex.get_server!(server.id) end
    end

    test "change_server/1 returns a server changeset" do
      server = server_fixture()
      assert %Ecto.Changeset{} = Plex.change_server(server)
    end
  end
end
