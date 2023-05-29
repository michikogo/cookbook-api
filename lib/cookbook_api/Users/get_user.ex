defmodule CookbookApi.Users.GetUser do
  @moduledoc """
  This module is responsible for fetching a user from the database.
  """

  import Ecto.Query

  alias CookbookApi.Repo
  alias CookbookApi.Users.User

  def call(email, password) do
    result =
      User
      |> where([u], u.email == ^email)
      |> Repo.one()

    case verify_password(password, result.password) do
      true -> {:ok, result}
      false -> {:error, "Invalid password"}
    end
  end

  defp verify_password(password, hash), do: Argon2.verify_pass(password, hash)
end
