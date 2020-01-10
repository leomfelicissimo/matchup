defmodule Matchup.Repo.Migrations.UserTrailsAddUserIdColumn do
  use Ecto.Migration

  def change do
    alter table("user_trails") do
      add :user_id, :integer
    end
  end
end
