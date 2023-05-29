defmodule CookbookApiWeb.Router do
  alias CookbookApiWeb.CatchAllController
  alias CookbookApiWeb.HealthController

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

  scope "/health" do
    get("/ready", HealthController, :ready)
    get("/live", HealthController, :live)
  end

  scope "/" do
    match(:*, "/*path", CatchAllController, :not_found)
  end
end
