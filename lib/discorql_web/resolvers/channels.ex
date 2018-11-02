defmodule DiscorqlWeb.Resolvers.Channels do
  alias Nostrum.Api

  def get_channel(_parent, %{id: id}, _res) do
    Api.get_channel(id)
  end

  def get_channel(%{channel_id: id}, _args, _res) do
    Api.get_channel(id)
  end
end
