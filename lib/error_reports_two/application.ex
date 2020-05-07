defmodule ErrorReportsTwo.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      ErrorReportsTwo.Repo,
      # Start the Telemetry supervisor
      ErrorReportsTwoWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ErrorReportsTwo.PubSub},
      # Start the Endpoint (http/https)
      ErrorReportsTwoWeb.Endpoint
      # Start a worker by calling: ErrorReportsTwo.Worker.start_link(arg)
      # {ErrorReportsTwo.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ErrorReportsTwo.Supervisor]
    {:ok, _} = Logger.add_backend(Sentry.LoggerBackend)
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ErrorReportsTwoWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
