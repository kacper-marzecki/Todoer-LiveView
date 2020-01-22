# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :todoer,
  ecto_repos: [Todoer.Repo]

# Configures the endpoint
config :todoer, TodoerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kKi7qzkBk6/IDefPzdShlYaV9MIPpqa3UYl1fyMpta0TZld1d7o3P4IyfdrCsasr",
  render_errors: [view: TodoerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Todoer.PubSub, adapter: Phoenix.PubSub.PG2],
  live_view: [
    signing_salt: "0PBXHXDb4h1sd5eGYNLeWpG2GMm0lIia"
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
