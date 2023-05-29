defmodule CookbookApiWeb.Schema.Users.Resolvers do
  @moduledoc """
  This module contains the resolvers for the users schema.
  """

  alias CookbookApi.Users

  def initial(_args, _info) do
    {:ok, "THE ENDPOINT WORKS!"}
  end

  def get_all_users(_args, _info) do
    Users.get_all_users()
  end

  def get_user(%{email: email, password: password}, _info) do
    Users.get_user(email, password)
  end
end
