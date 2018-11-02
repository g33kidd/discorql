defmodule DiscorqlWeb.Schema do
  use Absinthe.Schema

  alias Nostrum.Api
  alias Nostrum.Struct.Snowflake

  object :message do
    field :id, :string
    field :content, :string
  end

  query do
    field :get_channel_messages, list_of(:message) do
      arg :channel_id, non_null(:string)
      arg :limit, :integer

      resolve fn _, %{channel_id: id, limit: limit}, _ ->
        {:ok, flake} = Snowflake.cast(id)
        Api.get_channel_messages(flake, limit)
      end
    end
  end

  # mutation do
  # end

  # subscription do
  # end
end
