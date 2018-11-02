defmodule Discorql.Repo do
  use Ecto.Repo,
    otp_app: :discorql,
    adapter: Ecto.Adapters.Postgres
end
