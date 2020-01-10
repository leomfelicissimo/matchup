defmodule MatchupWeb.TrailView do
  use MatchupWeb, :view
  alias MatchupWeb.TrailView

  def render("index.json", %{trails: trails}) do
    %{data: render_many(trails, TrailView, "trail.json")}
  end

  def render("show.json", %{trail: trail}) do
    %{data: render_one(trail, TrailView, "trail.json")}
  end

  def render("trail.json", %{trail: trail}) do
    %{id: trail.id,
      description: trail.description}
  end
end
