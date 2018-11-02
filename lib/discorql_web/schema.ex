defmodule DiscorqlWeb.Schema do
  use Absinthe.Schema

  alias Nostrum.Api
  alias Nostrum.Struct.Snowflake

  object :channel do
    field :id, :snowflake
    field :guild_id, :snowflake
    field :position, :integer
    field :name, :string
    field :topic, :string
    field :nsfw, :boolean
    field :messages, list_of(:message)
  end

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

    # TODO: Turn this into a built-in DateTime type or something.
    # actually I don't think this is necessary unless doing server side stuff.
    field :timestamp, :string

    # TODO: Figure out how to resolve this... maybe it has to be done when the query happens.
    # field :channel, :channel
    # field :guild, :guild
  end

  object :user do
    field :id, :snowflake
    field :username, :string
    field :discriminator, :string
    field :avatar, :string
    field :bot, :boolean
    field :verified, :boolean
  end

  object :embed do
  end

  # TODO: move these test resolvers to their own files/folders under web/resolvers

  scalar :snowflake, name: "Snowflake" do
    serialize &Snowflake.dump/1
    parse &parse_snowflake/1
  end

  defp parse_snowflake(%Absinthe.Blueprint.Input.String{value: value}) do
    case Snowflake.cast(value) do
      {:ok, snowflake} -> {:ok, snowflake}
      _error -> :error
    end
  end

  defp parse_snowflake(%Absinthe.Blueprint.Input.Null{}) do
    {:ok, nil}
  end

  defp parse_snowflake(_) do
    :error
  end

  query do
    @desc "Gets a list of messages in a channel."
    field :get_channel_messages, list_of(:message) do
      @desc "The channel ID."
      arg :channel_id, non_null(:snowflake)

      @desc "How many messages should be fetched."
      arg :limit, :integer

      resolve fn _, %{channel_id: id, limit: limit}, _ ->
        Api.get_channel_messages(id, limit)
      end
    end

    @desc "Gets a list of guild channels."
    field :get_guild_channels, list_of(:channel) do
      @desc "The guild id to get channels from."
      arg :guild_id, non_null(:snowflake)

      resolve fn p, %{guild_id: id}, a ->
        IO.inspect(a)
        Api.get_guild_channels(id)
      end
    end

    @desc "Gets a channel."
    field :get_channel, :channel do
      arg :channel_id, non_null(:snowflake)

      resolve fn _, %{channel_id: id}, _ ->
        Api.get_channel(id)
      end
    end
  end

  # mutation do
  # end

  subscription do
    @desc "Listens for new messages created."
    field :message_create, :message do
      config fn args, _ ->
        {:ok, args.guild_id}
      end

      resolve fn message, _, _ ->
        {:ok, message}
      end
    end
  end
end
