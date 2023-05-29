defmodule CookbookApi.Users.GetAllUsers do
  @moduledoc """
  This module is responsible for fetching all users from the database.
  """

  import Ecto.Query

  alias CookbookApi.Users.User
  alias CookbookApi.Repo

  def call do
    result =
      User
      |> order_by(asc: :first_name)
      |> Repo.all()

    {:ok, result}
  end
end
