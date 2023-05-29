defmodule CookbookApi.Users do
  @moduledoc """
  This module defines the functions used to interact with the users table.
  """

  alias CookbookApi.Users.GetAllUsers

  @doc """
  Get all users.
  """
  @spec get_all_users :: {:ok, any}
  defdelegate get_all_users(), to: GetAllUsers, as: :call
end
