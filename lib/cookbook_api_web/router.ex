defmodule CookbookApiWeb.Router do
  use CookbookApiWeb, :router

  pipeline :graphql do
    plug :accepts, ["json"]
  end

  scope "/graphql" do
    pipe_through :graphql

    post "/", Absinthe.Plug,
      schema: CookbookApiWeb.Schema,
      json_codec: Jason
  end
end
