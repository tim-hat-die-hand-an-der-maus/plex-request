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

  describe "library" do
    alias PlexRequest.Plex.Library

    import PlexRequest.PlexFixtures

    @invalid_attrs %{name: nil}

    test "list_library/0 returns all library" do
      library = library_fixture()
      assert Plex.list_library() == [library]
    end

    test "get_library!/1 returns the library with given id" do
      library = library_fixture()
      assert Plex.get_library!(library.id) == library
    end

    test "create_library/1 with valid data creates a library" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %Library{} = library} = Plex.create_library(valid_attrs)
      assert library.name == "some name"
    end

    test "create_library/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plex.create_library(@invalid_attrs)
    end

    test "update_library/2 with valid data updates the library" do
      library = library_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %Library{} = library} = Plex.update_library(library, update_attrs)
      assert library.name == "some updated name"
    end

    test "update_library/2 with invalid data returns error changeset" do
      library = library_fixture()
      assert {:error, %Ecto.Changeset{}} = Plex.update_library(library, @invalid_attrs)
      assert library == Plex.get_library!(library.id)
    end

    test "delete_library/1 deletes the library" do
      library = library_fixture()
      assert {:ok, %Library{}} = Plex.delete_library(library)
      assert_raise Ecto.NoResultsError, fn -> Plex.get_library!(library.id) end
    end

    test "change_library/1 returns a library changeset" do
      library = library_fixture()
      assert %Ecto.Changeset{} = Plex.change_library(library)
    end
  end

  describe "server_library" do
    alias PlexRequest.Plex.ServerLibrary

    import PlexRequest.PlexFixtures

    @invalid_attrs %{name: nil}

    test "list_server_library/0 returns all server_library" do
      server_library = server_library_fixture()
      assert Plex.list_server_library() == [server_library]
    end

    test "get_server_library!/1 returns the server_library with given id" do
      server_library = server_library_fixture()
      assert Plex.get_server_library!(server_library.id) == server_library
    end

    test "create_server_library/1 with valid data creates a server_library" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %ServerLibrary{} = server_library} = Plex.create_server_library(valid_attrs)
      assert server_library.name == "some name"
    end

    test "create_server_library/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plex.create_server_library(@invalid_attrs)
    end

    test "update_server_library/2 with valid data updates the server_library" do
      server_library = server_library_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %ServerLibrary{} = server_library} = Plex.update_server_library(server_library, update_attrs)
      assert server_library.name == "some updated name"
    end

    test "update_server_library/2 with invalid data returns error changeset" do
      server_library = server_library_fixture()
      assert {:error, %Ecto.Changeset{}} = Plex.update_server_library(server_library, @invalid_attrs)
      assert server_library == Plex.get_server_library!(server_library.id)
    end

    test "delete_server_library/1 deletes the server_library" do
      server_library = server_library_fixture()
      assert {:ok, %ServerLibrary{}} = Plex.delete_server_library(server_library)
      assert_raise Ecto.NoResultsError, fn -> Plex.get_server_library!(server_library.id) end
    end

    test "change_server_library/1 returns a server_library changeset" do
      server_library = server_library_fixture()
      assert %Ecto.Changeset{} = Plex.change_server_library(server_library)
    end
  end

  describe "server_library_item" do
    alias PlexRequest.Plex.ServerLibraryItem

    import PlexRequest.PlexFixtures

    @invalid_attrs %{name: nil, year: nil, rating_key: nil}

    test "list_server_library_item/0 returns all server_library_item" do
      server_library_item = server_library_item_fixture()
      assert Plex.list_server_library_item() == [server_library_item]
    end

    test "get_server_library_item!/1 returns the server_library_item with given id" do
      server_library_item = server_library_item_fixture()
      assert Plex.get_server_library_item!(server_library_item.id) == server_library_item
    end

    test "create_server_library_item/1 with valid data creates a server_library_item" do
      valid_attrs = %{name: "some name", year: 42, rating_key: 42}

      assert {:ok, %ServerLibraryItem{} = server_library_item} = Plex.create_server_library_item(valid_attrs)
      assert server_library_item.name == "some name"
      assert server_library_item.year == 42
      assert server_library_item.rating_key == 42
    end

    test "create_server_library_item/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Plex.create_server_library_item(@invalid_attrs)
    end

    test "update_server_library_item/2 with valid data updates the server_library_item" do
      server_library_item = server_library_item_fixture()
      update_attrs = %{name: "some updated name", year: 43, rating_key: 43}

      assert {:ok, %ServerLibraryItem{} = server_library_item} = Plex.update_server_library_item(server_library_item, update_attrs)
      assert server_library_item.name == "some updated name"
      assert server_library_item.year == 43
      assert server_library_item.rating_key == 43
    end

    test "update_server_library_item/2 with invalid data returns error changeset" do
      server_library_item = server_library_item_fixture()
      assert {:error, %Ecto.Changeset{}} = Plex.update_server_library_item(server_library_item, @invalid_attrs)
      assert server_library_item == Plex.get_server_library_item!(server_library_item.id)
    end

    test "delete_server_library_item/1 deletes the server_library_item" do
      server_library_item = server_library_item_fixture()
      assert {:ok, %ServerLibraryItem{}} = Plex.delete_server_library_item(server_library_item)
      assert_raise Ecto.NoResultsError, fn -> Plex.get_server_library_item!(server_library_item.id) end
    end

    test "change_server_library_item/1 returns a server_library_item changeset" do
      server_library_item = server_library_item_fixture()
      assert %Ecto.Changeset{} = Plex.change_server_library_item(server_library_item)
    end
  end
end
