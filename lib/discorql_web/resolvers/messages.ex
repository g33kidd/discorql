defmodule DiscorqlWeb.Resolvers.Messages do
  alias Nostrum.Api

  def get_channel_messages(%{id: id}, %{limit: limit}, _res) do
    Api.get_channel_messages(id, limit)
  end

  def get_channel_messages(%{id: id}, %{}, _res) do
    Api.get_channel_messages(id, :infinity)
  end

  def get_channel_messages(_parent, %{channel_id: id, limit: limit}, _res) do
    Api.get_channel_messages(id, limit)
  end

  def get_channel_messages(_parent, %{channel_id: id}, _res) do
    Api.get_channel_messages(id, :infinity)
  end
end
