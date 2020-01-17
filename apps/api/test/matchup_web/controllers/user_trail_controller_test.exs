defmodule MatchupWeb.UserTrailControllerTest do
  use MatchupWeb.ConnCase

  alias Matchup.Matches
  alias Matchup.Matches.UserTrail

  @create_attrs %{
    trail_path: "some trail_path"
  }
  @update_attrs %{
    trail_path: "some updated trail_path"
  }
  @invalid_attrs %{trail_path: nil}

  def fixture(:user_trail) do
    {:ok, user_trail} = Matches.create_user_trail(@create_attrs)
    user_trail
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all user_trails", %{conn: conn} do
      conn = get(conn, Routes.user_trail_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user_trail" do
    test "renders user_trail when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_trail_path(conn, :create), user_trail: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.user_trail_path(conn, :show, id))

      assert %{
               "id" => id,
               "trail_path" => "some trail_path"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_trail_path(conn, :create), user_trail: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user_trail" do
    setup [:create_user_trail]

    test "renders user_trail when data is valid", %{conn: conn, user_trail: %UserTrail{id: id} = user_trail} do
      conn = put(conn, Routes.user_trail_path(conn, :update, user_trail), user_trail: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.user_trail_path(conn, :show, id))

      assert %{
               "id" => id,
               "trail_path" => "some updated trail_path"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user_trail: user_trail} do
      conn = put(conn, Routes.user_trail_path(conn, :update, user_trail), user_trail: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user_trail" do
    setup [:create_user_trail]

    test "deletes chosen user_trail", %{conn: conn, user_trail: user_trail} do
      conn = delete(conn, Routes.user_trail_path(conn, :delete, user_trail))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_trail_path(conn, :show, user_trail))
      end
    end
  end

  defp create_user_trail(_) do
    user_trail = fixture(:user_trail)
    {:ok, user_trail: user_trail}
  end
end
