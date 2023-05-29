defmodule CookbookApiWeb.Schema.Users.Queries do
  @moduledoc """
  This module contains the queries for the users schema.
  """

  use Absinthe.Schema.Notation
  alias CookbookApiWeb.Schema.Users.Resolvers

  object :users_query do
    field :initial, :string do
      resolve(&Resolvers.initial/2)
    end

    field :get_all_users, list_of(:user) do
      resolve(&Resolvers.get_all_users/2)
    end
  end
end
