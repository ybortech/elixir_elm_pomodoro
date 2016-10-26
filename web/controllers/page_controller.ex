defmodule Pomorodo.PageController do
  use Pomorodo.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
