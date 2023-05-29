defmodule CookbookApiWeb.Schema.Users.Types do
  @moduledoc """
  This module defines the types used in the schema for the users table.
  """

  use Absinthe.Schema.Notation
  import_types(CookbookApiWeb.Schema.Users.Queries)
  import_types(CookbookApiWeb.Schema.Users.Mutations)

  object :user do
    field :uid, :string
    field :first_name, :string
    field :last_name, :string
    field :email, :string
    field :password, :string
    field :recipe_ids, list_of(:string)
  end
end
