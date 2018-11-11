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

    field :roles, list_of(:role) do
      resolve &Guilds.get_guild_roles/3
    end

    field :invites, list_of(:invite) do
      resolve &Guilds.get_guild_invites/3
    end

    field :channels, list_of(:channel) do
      resolve &Guilds.get_guild_channels/3
    end
  end

  object :invite do
    field :code, :string
    field :guild, :guild
    field :channel, :channel
    field :inviter, :user
    field :uses, :integer
    field :max_uses, :integer
    field :max_age, :integer
    field :temporary, :boolean
    field :created_at, :string
    field :revoked, :boolean
  end

  object :role do
    field :id, :snowflake
    field :name, :string
    field :color, :integer
    field :hoist, :boolean
    field :position, :integer
    field :permissions, :integer
    field :managed, :boolean
    field :mentionable, :boolean
  end

  object :prune do
    field :pruned, :integer
  end

  object :guild_queries do
    @desc "Gets a guild"
    field :guild, :guild do
      arg :id, non_null(:snowflake)

      resolve &Guilds.get_guild/3
    end

    @desc "Gets all guilds this bot is in"
    field :guilds, list_of(:guild) do
      resolve &Guilds.list_guilds/3
    end

    @desc "Gets channels in a guild"
    field :guild_channels, list_of(:channel) do
      arg :id, non_null(:snowflake)

      resolve &Guilds.get_guild_channels/3
    end

    @desc "Get guild roles"
    field :guild_roles, list_of(:role) do
      arg :id, non_null(:snowflake)
      resolve &Guilds.get_guild_roles/3
    end

    @desc "Gets guild invites"
    field :guild_invites, list_of(:invite) do
      arg :id, non_null(:snowflake)
      resolve &Guilds.get_guild_invites/3
    end
  end

  object :guild_mutation do
    @desc "Prune members in a server within days"
    field :begin_prune, :prune do
      arg :guild_id, non_null(:snowflake)
      arg :days, :integer
      resolve &Guilds.begin_guild_prune/3
    end
  end
end
