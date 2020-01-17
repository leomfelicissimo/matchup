defmodule MatchupWeb.Router do
  use MatchupWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MatchupWeb do
    pipe_through :api

    resources "/users", UserController
    resources "/trails", TrailController, except: [:new, :edit]
    resources "/usertrails", UserTrailController, except: [:new, :edit]
  end
end
