defmodule Matchup.Repo.Migrations.CreateTrails do
  use Ecto.Migration

  def change do
    create table(:trails) do
      add :description, :string

      timestamps()
    end

  end
end
