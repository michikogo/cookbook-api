defmodule CookbookApi.Users do
  @moduledoc """
  This module defines the functions used to interact with the users table.
  """

  alias CookbookApi.Users.CreateUser
  alias CookbookApi.Users.GetAllUsers
  alias CookbookApi.Users.GetUser

  @doc """
  Creates a user.
  """
  @spec create_user(map()) :: {:ok, map} | {:error, String.t()}
  defdelegate create_user(params), to: CreateUser, as: :call

  @doc """
  Get all users.
  """
  @spec get_all_users :: {:ok, any}
  defdelegate get_all_users(), to: GetAllUsers, as: :call

  @doc """
  Get a user.
  """
  defdelegate get_user(email, password), to: GetUser, as: :call
end
