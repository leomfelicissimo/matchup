defmodule Matchup.Repo do
  use Ecto.Repo,
    otp_app: :matchup,
    adapter: Ecto.Adapters.Postgres
end
