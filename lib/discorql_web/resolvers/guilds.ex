defmodule DiscorqlWeb.Resolvers.Guilds do
  alias Nostrum.{Api, Cache}

  # GET ALL GUILDS
  def list_guilds(_parent, _args, _res) do
    guilds =
      Cache.GuildCache.all()
      |> Enum.to_list()

    {:ok, guilds}
  end

  # GET A GUILD

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

  # GET GUILD CHANNELS

  def get_guild_channels(_parent, %{id: id}, _res) do
    Api.get_guild_channels(id)
  end

  def get_guild_channels(%{id: id}, _args, _res) do
    Api.get_guild_channels(id)
  end

  # GET GUILD ROLES

  def get_guild_roles(_parent, %{id: id}, _res) do
    Api.get_guild_roles(id)
  end

  def get_guild_roles(%{guild_id: id}, _args, _res) do
    Api.get_guild_roles(id)
  end

  def get_guild_roles(%{id: id}, _args, _res) do
    Api.get_guild_roles(id)
  end

  # GET GUILD INVITES

  def get_guild_invites(_parent, %{id: id}, _res) do
    Api.get_guild_invites(id)
  end

  def get_guild_invites(%{id: id}, _args, _res) do
    Api.get_guild_invites(id)
  end

  def begin_guild_prune(_parent, args, _res) do
    case args do
      %{guild_id: id, days: days} -> Api.begin_guild_prune(id, days)
      %{guild_id: id} -> Api.begin_guild_prune(id, 3)
    end
  end
end
