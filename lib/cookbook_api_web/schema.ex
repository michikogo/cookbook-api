defmodule CookbookApiWeb.Schema do
  use Absinthe.Schema

  import_types(CookbookApiWeb.Schema.Users.Types)

  query do
    import_fields(:users_query)
  end

  mutation do
    import_fields(:users_mutation)
  end
end
