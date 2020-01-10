defmodule Matchup.AccountsTest do
  use Matchup.DataCase

  alias Matchup.Accounts

  describe "users" do
    alias Matchup.Accounts.User

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "users" do
    alias Matchup.Accounts.User

    @valid_attrs %{age: 42, bio: "some bio", last_name: "some last_name", name: "some name", photo_url: "some photo_url"}
    @update_attrs %{age: 43, bio: "some updated bio", last_name: "some updated last_name", name: "some updated name", photo_url: "some updated photo_url"}
    @invalid_attrs %{age: nil, bio: nil, last_name: nil, name: nil, photo_url: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.age == 42
      assert user.bio == "some bio"
      assert user.last_name == "some last_name"
      assert user.name == "some name"
      assert user.photo_url == "some photo_url"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.age == 43
      assert user.bio == "some updated bio"
      assert user.last_name == "some updated last_name"
      assert user.name == "some updated name"
      assert user.photo_url == "some updated photo_url"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "trails" do
    alias Matchup.Accounts.Trail

    @valid_attrs %{description: "some description"}
    @update_attrs %{description: "some updated description"}
    @invalid_attrs %{description: nil}

    def trail_fixture(attrs \\ %{}) do
      {:ok, trail} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_trail()

      trail
    end

    test "list_trails/0 returns all trails" do
      trail = trail_fixture()
      assert Accounts.list_trails() == [trail]
    end

    test "get_trail!/1 returns the trail with given id" do
      trail = trail_fixture()
      assert Accounts.get_trail!(trail.id) == trail
    end

    test "create_trail/1 with valid data creates a trail" do
      assert {:ok, %Trail{} = trail} = Accounts.create_trail(@valid_attrs)
      assert trail.description == "some description"
    end

    test "create_trail/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_trail(@invalid_attrs)
    end

    test "update_trail/2 with valid data updates the trail" do
      trail = trail_fixture()
      assert {:ok, %Trail{} = trail} = Accounts.update_trail(trail, @update_attrs)
      assert trail.description == "some updated description"
    end

    test "update_trail/2 with invalid data returns error changeset" do
      trail = trail_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_trail(trail, @invalid_attrs)
      assert trail == Accounts.get_trail!(trail.id)
    end

    test "delete_trail/1 deletes the trail" do
      trail = trail_fixture()
      assert {:ok, %Trail{}} = Accounts.delete_trail(trail)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_trail!(trail.id) end
    end

    test "change_trail/1 returns a trail changeset" do
      trail = trail_fixture()
      assert %Ecto.Changeset{} = Accounts.change_trail(trail)
    end
  end
end
