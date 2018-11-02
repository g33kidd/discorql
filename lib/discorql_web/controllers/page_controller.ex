defmodule DiscorqlWeb.PageController do
  use DiscorqlWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
