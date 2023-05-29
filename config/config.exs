# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :cookbook_api,
  ecto_repos: [CookbookApi.Repo]

# Configures the endpoint
config :cookbook_api, CookbookApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FKI5LPKUjg0hSaBNMM6Dyp7Xapo1rWrI8x6yCx5bDb1RtAXEvORGnP/I0mq7FihC",
  render_errors: [view: CookbookApiWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CookbookApi.PubSub,
  live_view: [signing_salt: "sFK1m00Y"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
