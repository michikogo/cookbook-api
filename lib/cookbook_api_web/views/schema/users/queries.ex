defmodule CookbookApiWeb.Schema.Users.Queries do
  use Absinthe.Schema.Notation
  alias CookbookApiWeb.Schema.Users.Resolvers

  object :users_query do
    field :initial, :string do
      resolve(&Resolvers.initial/2)
    end
  end
end
