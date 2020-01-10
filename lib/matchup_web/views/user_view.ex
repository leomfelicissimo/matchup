defmodule MatchupWeb.UserView do
  use MatchupWeb, :view
  alias MatchupWeb.UserView

  def render("index.json", %{users: users}) do
    %{data: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      name: user.name,
      last_name: user.last_name,
      bio: user.bio,
      age: user.age,
      photo_url: user.photo_url}
  end
end
