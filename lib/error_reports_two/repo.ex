defmodule ErrorReportsTwo.Repo do
  use Ecto.Repo,
    otp_app: :error_reports_two,
    adapter: Ecto.Adapters.Postgres
end
