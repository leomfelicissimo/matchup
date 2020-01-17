defmodule MatchupWeb.UserTrailController do
  use MatchupWeb, :controller

  alias Matchup.Matches
  alias Matchup.Matches.UserTrail

  action_fallback MatchupWeb.FallbackController

  def index(conn, _params) do
    user_trails = Matches.list_user_trails()
    render(conn, "index.json", user_trails: user_trails)
  end

  def create(conn, %{"user_trail" => user_trail_params}) do
    with {:ok, %UserTrail{} = user_trail} <- Matches.create_user_trail(user_trail_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.user_trail_path(conn, :show, user_trail))
      |> render("show.json", user_trail: user_trail)
    end
  end

  def show(conn, %{"id" => id}) do
    user_trail = Matches.get_user_trail!(id)
    render(conn, "show.json", user_trail: user_trail)
  end

  def update(conn, %{"id" => id, "user_trail" => user_trail_params}) do
    user_trail = Matches.get_user_trail!(id)

    with {:ok, %UserTrail{} = user_trail} <- Matches.update_user_trail(user_trail, user_trail_params) do
      render(conn, "show.json", user_trail: user_trail)
    end
  end

  def delete(conn, %{"id" => id}) do
    user_trail = Matches.get_user_trail!(id)

    with {:ok, %UserTrail{}} <- Matches.delete_user_trail(user_trail) do
      send_resp(conn, :no_content, "")
    end
  end
end
