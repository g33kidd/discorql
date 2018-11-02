defmodule DiscorqlWeb.Schema.ChannelTypes do
  use Absinthe.Schema.Notation

  alias DiscorqlWeb.Resolvers.{Channels, Messages, Guilds}

  object :channel do
    field :id, :snowflake
    field :guild_id, :snowflake
    field :position, :integer
    field :name, :string
    field :topic, :string
    field :nsfw, :boolean

    field :guild, :guild do
      resolve &Guilds.get_guild/3
    end

    field :messages, list_of(:message) do
      arg :limit, :integer

      resolve &Messages.get_channel_messages/3
    end
  end

  object :channel_queries do
    @desc "Gets messages in a channel"
    field :channel_messages, list_of(:message) do
      arg :channel_id, non_null(:snowflake)

      @desc "How many messages to get"
      arg :limit, :integer

      resolve &Messages.get_channel_messages/3
    end

    @desc "Gets a channel"
    field :channel, :channel do
      arg :id, non_null(:snowflake)

      resolve &Channels.get_channel/3
    end
  end
end
