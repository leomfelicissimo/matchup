defmodule MatchupWeb.UserTrailView do
  use MatchupWeb, :view
  alias MatchupWeb.UserTrailView

  def render("index.json", %{user_trails: user_trails}) do
    %{data: render_many(user_trails, UserTrailView, "user_trail.json")}
  end

  def render("show.json", %{user_trail: user_trail}) do
    %{data: render_one(user_trail, UserTrailView, "user_trail.json")}
  end

  def render("user_trail.json", %{user_trail: user_trail}) do
    %{id: user_trail.id,
      trail_path: user_trail.trail_path}
  end
end
