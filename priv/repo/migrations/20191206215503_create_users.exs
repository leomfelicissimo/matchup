defmodule Matchup.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :last_name, :string
      add :bio, :string
      add :age, :integer
      add :photo_url, :string

      timestamps()
    end

  end
end
