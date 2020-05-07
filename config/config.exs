# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :error_reports_two,
  ecto_repos: [ErrorReportsTwo.Repo]

# Configures the endpoint
config :error_reports_two, ErrorReportsTwoWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "BibbD789H4nCneZne4lwtk5WgIR3hSis02Igy+9HiN0/gt4fFeNBnVzw/4JIIZxo",
  render_errors: [view: ErrorReportsTwoWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: ErrorReportsTwo.PubSub,
  live_view: [signing_salt: "Ph5tHVKk"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :sentry,
  dsn: (raise "DSN"),
  enable_source_code_context: true,
  root_source_code_path:      File.cwd!,
  included_environments:      [:dev, :prod]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
