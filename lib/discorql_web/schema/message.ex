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

    field :channel, :channel do
      resolve &Channels.get_channel/3
    end

    field :guild, :guild do
      resolve &Guilds.get_guild/3
    end

    # TODO: Need to get emojis working first in order to add this..
    # field :reactions, list_of(:user) do
    #   # TODO: Create an emoji scalar type that will convert a string into an Emoji or something..
    #   # because we need the emoji type to get reactions of a certain emoji.
    #   # arg :emoji, :string
    #   arg :channel_id, non_null(:snowflake)
    #   arg :message_id, non_null(:snowflake)

    #   resolve &Messages.get_reactions/3
    # end
  end

  object :message_queries do
    field :message, :message do
      arg :channel_id, non_null(:snowflake)
      arg :message_id, non_null(:snowflake)

      resolve &Messages.get_channel_message/3
    end
  end
end
