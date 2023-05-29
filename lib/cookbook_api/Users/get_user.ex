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
      |> where([u], u.email == ^email and u.password == ^password)
      |> Repo.one()

    {:ok, result}
  end
end
