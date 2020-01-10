defmodule Matchup.Matches.UserTrail do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user_trails" do
    field :trail_path, :string
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(user_trail, attrs) do
    user_trail
    |> cast(attrs, [:trail_path, :user_id])
    |> validate_required([:trail_path, :user_id])
  end
end
