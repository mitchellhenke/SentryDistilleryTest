defmodule ErrorReportsTwoWeb.PageController do
  use ErrorReportsTwoWeb, :controller

  def index(conn, _params) do
    raise "hello sentry"
    render(conn, "index.html")
  end
end
