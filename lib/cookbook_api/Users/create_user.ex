defmodule CookbookApi.Users.CreateUser do
  @moduledoc """
  This module is responsible for creating a user in the database.
  """

  alias CookbookApi.Repo
  alias CookbookApi.Users.User

  def call(params) do
    arams = Map.put(params, :password, hash_password(params[:password]))

    case User.changeset(params) do
      %{valid?: false} = changeset ->
        {:error, ChangesetErrors.format(changeset)}

      changeset ->
        Repo.insert(changeset,
          returning: true,
          conflict_target: [:email],
          on_conflict: :nothing
        )
    end
  end

  defp hash_password(password), do: Argon2.hash_pwd_salt(password)
end
