defmodule CookbookApiWeb.CatchAllController do
  @moduledoc false

  use CookbookApiWeb, :controller

  def not_found(conn, _params) do
    conn
    |> put_status(404)
    |> text("Not found")
  end
end
