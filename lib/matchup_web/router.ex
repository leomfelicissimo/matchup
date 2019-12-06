defmodule MatchupWeb.Router do
  use MatchupWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MatchupWeb do
    pipe_through :api
  end
end
