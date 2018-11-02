defmodule DiscorqlWeb.Schema do
  use Absinthe.Schema

  alias Nostrum.Api
  alias Nostrum.Struct.Snowflake

  import_types DiscorqlWeb.Schema.CustomTypes
  import_types DiscorqlWeb.Schema.ChannelTypes
  import_types DiscorqlWeb.Schema.MessageTypes
  import_types DiscorqlWeb.Schema.GuildTypes
  import_types DiscorqlWeb.Schema.UserTypes

  # TODO: move these test resolvers to their own files/folders under web/resolvers
  query do
    import_fields :channel_queries
    import_fields :guild_queries
  end

  # mutation do
  # end

  subscription do
    # TODO: make this work or something
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
