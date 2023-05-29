defmodule CookbookApi.Repo do
  use Ecto.Repo,
    otp_app: :cookbook_api,
    adapter: Ecto.Adapters.Postgres
end
