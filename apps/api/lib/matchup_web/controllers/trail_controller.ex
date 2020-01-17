defmodule MatchupWeb.TrailController do
  use MatchupWeb, :controller

  alias Matchup.Accounts
  alias Matchup.Accounts.Trail

  action_fallback MatchupWeb.FallbackController

  def index(conn, _params) do
    trails = Accounts.list_trails()
    render(conn, "index.json", trails: trails)
  end

  def create(conn, %{"trail" => trail_params}) do
    with {:ok, %Trail{} = trail} <- Accounts.create_trail(trail_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.trail_path(conn, :show, trail))
      |> render("show.json", trail: trail)
    end
  end

  def show(conn, %{"id" => id}) do
    trail = Accounts.get_trail!(id)
    render(conn, "show.json", trail: trail)
  end

  def update(conn, %{"id" => id, "trail" => trail_params}) do
    trail = Accounts.get_trail!(id)

    with {:ok, %Trail{} = trail} <- Accounts.update_trail(trail, trail_params) do
      render(conn, "show.json", trail: trail)
    end
  end

  def delete(conn, %{"id" => id}) do
    trail = Accounts.get_trail!(id)

    with {:ok, %Trail{}} <- Accounts.delete_trail(trail) do
      send_resp(conn, :no_content, "")
    end
  end
end
