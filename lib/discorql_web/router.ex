defmodule DiscorqlWeb.Router do
  use DiscorqlWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", DiscorqlWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  forward "/api", Absinthe.Plug, schema: DiscorqlWeb.Schema
  forward "/gql", Absinthe.Plug.GraphiQL, schema: DiscorqlWeb.Schema
end
