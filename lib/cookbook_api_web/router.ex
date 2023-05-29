defmodule CookbookApiWeb.Router do
  use CookbookApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", CookbookApiWeb do
  end
end
