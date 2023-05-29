defmodule CookbookApiWeb.PageController do
  use CookbookApiWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
