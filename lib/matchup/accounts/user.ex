defmodule Matchup.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :age, :integer
    field :bio, :string
    field :last_name, :string
    field :name, :string
    field :photo_url, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :last_name, :bio, :age, :photo_url])
    |> validate_required([:name, :last_name, :bio, :age, :photo_url])
  end
end
