defmodule Matchup.Accounts.Trail do
  use Ecto.Schema
  import Ecto.Changeset

  schema "trails" do
    field :description, :string

    timestamps()
  end

  @doc false
  def changeset(trail, attrs) do
    trail
    |> cast(attrs, [:description])
    |> validate_required([:description])
  end
end
