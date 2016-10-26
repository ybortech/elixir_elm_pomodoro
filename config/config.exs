# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :pomorodo, Pomorodo.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "n8wuLZ8clWeB6ydLz9W2aeodnX1rvfbTMC4NM3uQt0rhajvKUIlTLzUFTnvb50ps",
  render_errors: [view: Pomorodo.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Pomorodo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
