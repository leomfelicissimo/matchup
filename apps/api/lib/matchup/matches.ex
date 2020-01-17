defmodule Matchup.Matches do
  @moduledoc """
  The Matches context.
  """

  import Ecto.Query, warn: false
  alias Matchup.Repo

  alias Matchup.Matches.UserTrail

  @doc """
  Returns the list of user_trails.

  ## Examples

      iex> list_user_trails()
      [%UserTrail{}, ...]

  """
  def list_user_trails do
    Repo.all(UserTrail)
  end

  @doc """
  Gets a single user_trail.

  Raises `Ecto.NoResultsError` if the User trail does not exist.

  ## Examples

      iex> get_user_trail!(123)
      %UserTrail{}

      iex> get_user_trail!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_trail!(id), do: Repo.get!(UserTrail, id)

  @doc """
  Creates a user_trail.

  ## Examples

      iex> create_user_trail(%{field: value})
      {:ok, %UserTrail{}}

      iex> create_user_trail(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_trail(attrs \\ %{}) do
    %UserTrail{}
    |> UserTrail.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_trail.

  ## Examples

      iex> update_user_trail(user_trail, %{field: new_value})
      {:ok, %UserTrail{}}

      iex> update_user_trail(user_trail, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_trail(%UserTrail{} = user_trail, attrs) do
    user_trail
    |> UserTrail.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a UserTrail.

  ## Examples

      iex> delete_user_trail(user_trail)
      {:ok, %UserTrail{}}

      iex> delete_user_trail(user_trail)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_trail(%UserTrail{} = user_trail) do
    Repo.delete(user_trail)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_trail changes.

  ## Examples

      iex> change_user_trail(user_trail)
      %Ecto.Changeset{source: %UserTrail{}}

  """
  def change_user_trail(%UserTrail{} = user_trail) do
    UserTrail.changeset(user_trail, %{})
  end
end
