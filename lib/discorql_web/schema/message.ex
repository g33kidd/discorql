defmodule DiscorqlWeb.Schema.MessageTypes do
  use Absinthe.Schema.Notation

  alias DiscorqlWeb.Resolvers.{Channels, Messages, Guilds}

  object :message do
    field :id, :snowflake
    field :guild_id, :snowflake
    field :channel_id, :snowflake
    field :content, :string
    field :pinned, :boolean
    field :author, :user
    field :mentions, list_of(:user)
    field :mention_everyone, :boolean
    field :mention_roles, list_of(:snowflake)
    field :timestamp, :string

    # TODO: Figure out how to resolve this... maybe it has to be done when the query happens.
    field :channel, :channel do
      resolve &Channels.get_channel/3
    end

    field :guild, :guild do
      resolve &Guilds.get_guild/3
    end
  end
end
