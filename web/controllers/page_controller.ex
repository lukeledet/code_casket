defmodule CodeCasket.PageController do
  use CodeCasket.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
