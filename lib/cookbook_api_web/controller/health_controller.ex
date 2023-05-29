defmodule CookbookApiWeb.HealthController do
  @moduledoc false

  use CookbookApiWeb, :controller

  def ready(conn, _params) do
    conn
    |> put_status(200)
    |> text("App is ready.")
  end

  def live(conn, _params) do
    conn
    |> put_status(200)
    |> text("App is live.")
  end
end
