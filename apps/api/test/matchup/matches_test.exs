defmodule Matchup.MatchesTest do
  use Matchup.DataCase

  alias Matchup.Matches

  describe "user_trails" do
    alias Matchup.Matches.UserTrail

    @valid_attrs %{trail_path: "some trail_path"}
    @update_attrs %{trail_path: "some updated trail_path"}
    @invalid_attrs %{trail_path: nil}

    def user_trail_fixture(attrs \\ %{}) do
      {:ok, user_trail} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Matches.create_user_trail()

      user_trail
    end

    test "list_user_trails/0 returns all user_trails" do
      user_trail = user_trail_fixture()
      assert Matches.list_user_trails() == [user_trail]
    end

    test "get_user_trail!/1 returns the user_trail with given id" do
      user_trail = user_trail_fixture()
      assert Matches.get_user_trail!(user_trail.id) == user_trail
    end

    test "create_user_trail/1 with valid data creates a user_trail" do
      assert {:ok, %UserTrail{} = user_trail} = Matches.create_user_trail(@valid_attrs)
      assert user_trail.trail_path == "some trail_path"
    end

    test "create_user_trail/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Matches.create_user_trail(@invalid_attrs)
    end

    test "update_user_trail/2 with valid data updates the user_trail" do
      user_trail = user_trail_fixture()
      assert {:ok, %UserTrail{} = user_trail} = Matches.update_user_trail(user_trail, @update_attrs)
      assert user_trail.trail_path == "some updated trail_path"
    end

    test "update_user_trail/2 with invalid data returns error changeset" do
      user_trail = user_trail_fixture()
      assert {:error, %Ecto.Changeset{}} = Matches.update_user_trail(user_trail, @invalid_attrs)
      assert user_trail == Matches.get_user_trail!(user_trail.id)
    end

    test "delete_user_trail/1 deletes the user_trail" do
      user_trail = user_trail_fixture()
      assert {:ok, %UserTrail{}} = Matches.delete_user_trail(user_trail)
      assert_raise Ecto.NoResultsError, fn -> Matches.get_user_trail!(user_trail.id) end
    end

    test "change_user_trail/1 returns a user_trail changeset" do
      user_trail = user_trail_fixture()
      assert %Ecto.Changeset{} = Matches.change_user_trail(user_trail)
    end
  end
end
