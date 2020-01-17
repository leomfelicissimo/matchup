defmodule Matchup.Repo.Migrations.CreateUserTrails do
  use Ecto.Migration

  def change do
    create table(:user_trails) do
      add :trail_path, :string

      timestamps()
    end

  end
end
