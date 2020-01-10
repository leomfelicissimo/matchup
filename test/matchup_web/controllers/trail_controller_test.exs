defmodule MatchupWeb.TrailControllerTest do
  use MatchupWeb.ConnCase

  alias Matchup.Accounts
  alias Matchup.Accounts.Trail

  @create_attrs %{
    description: "some description"
  }
  @update_attrs %{
    description: "some updated description"
  }
  @invalid_attrs %{description: nil}

  def fixture(:trail) do
    {:ok, trail} = Accounts.create_trail(@create_attrs)
    trail
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all trails", %{conn: conn} do
      conn = get(conn, Routes.trail_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create trail" do
    test "renders trail when data is valid", %{conn: conn} do
      conn = post(conn, Routes.trail_path(conn, :create), trail: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.trail_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.trail_path(conn, :create), trail: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update trail" do
    setup [:create_trail]

    test "renders trail when data is valid", %{conn: conn, trail: %Trail{id: id} = trail} do
      conn = put(conn, Routes.trail_path(conn, :update, trail), trail: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.trail_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, trail: trail} do
      conn = put(conn, Routes.trail_path(conn, :update, trail), trail: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete trail" do
    setup [:create_trail]

    test "deletes chosen trail", %{conn: conn, trail: trail} do
      conn = delete(conn, Routes.trail_path(conn, :delete, trail))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.trail_path(conn, :show, trail))
      end
    end
  end

  defp create_trail(_) do
    trail = fixture(:trail)
    {:ok, trail: trail}
  end
end
