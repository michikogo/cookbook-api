defmodule CookbookApiWeb.Schema.Users.Mutations do
  @moduledoc """
  This module contains the mutations for the users schema.
  """

  use Absinthe.Schema.Notation
  alias CookbookApiWeb.Schema.Users.Resolvers

  object :users_mutation do
    field :create_user, :string do
      arg(:first_name, non_null(:string))
      arg(:last_name, non_null(:string))
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&Resolvers.create_user/2)
    end
  end
end
