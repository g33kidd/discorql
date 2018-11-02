defmodule DiscorqlWeb.Schema.GuildTypes do
  use Absinthe.Schema.Notation

  alias DiscorqlWeb.Resolvers.{Guilds, Messages, Channels}

  object :guild do
    field :id, :snowflake
    field :name, :string
    field :owner_id, :snowflake
    field :region, :string
    field :afk_channel_id, :snowflake
    field :features, list_of(:string)
    field :large, :boolean
    field :unavailable, :boolean
    field :member_count, :integer
  end

  object :guild_queries do
    @desc "Gets a guild"
    field :guild, :guild do
      arg :id, non_null(:snowflake)

      resolve &Guilds.get_guild/3
    end

    @desc "Gets channels in a guild"
    field :guild_channels, list_of(:channel) do
      arg :id, non_null(:snowflake)

      resolve &Guilds.get_guild_channels/3
    end
  end
end
