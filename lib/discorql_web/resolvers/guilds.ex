defmodule DiscorqlWeb.Resolvers.Guilds do
  alias Nostrum.Api

  def get_guild(%{guild_id: id}, _args, _res) do
    Api.get_guild(id)
  end

  def get_guild(%{id: id}, _args, _res) do
    Api.get_guild(id)
  end

  def get_guild(_parent, %{guild_id: id}, _res) do
    Api.get_guild(id)
  end

  def get_guild(_parent, %{id: id}, _res) do
    Api.get_guild(id)
  end

  def get_guild_channels(_parent, %{id: id}, _res) do
    Api.get_guild_channels(id)
  end
end
