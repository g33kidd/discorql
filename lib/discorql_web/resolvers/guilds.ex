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

  def get_guild_channels(%{id: id}, _args, _res) do
    Api.get_guild_channels(id)
  end

  def get_guild_roles(_parent, %{id: id}, _res) do
    Api.get_guild_roles(id)
  end

  def get_guild_roles(%{guild_id: id}, _args, _res) do
    Api.get_guild_roles(id)
  end

  def get_guild_roles(%{id: id}, _args, _res) do
    Api.get_guild_roles(id)
  end

  def get_guild_invites(_parent, %{id: id}, _res) do
    Api.get_guild_invites(id)
  end

  def get_guild_invites(%{id: id}, _args, _res) do
    Api.get_guild_invites(id)
  end
end
