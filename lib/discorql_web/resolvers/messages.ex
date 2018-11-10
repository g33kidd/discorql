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

  def get_channel_messages(_parent, %{channel_id: channel_id, message_id: message_id}, _res) do
    Api.get_channel_message(channel_id, message_id)
  end

  # TODO: possible to move all the above functions into one?
  # def get_channel_messages(parent, args, res) do
  #   case do
  #   end
  # end

  # def get_reactions(_parent, %{channel_id: channel_id, message_id: message_id}, _res) do
  #   Api.get_reactions(channel_id, message_id)
  # end
end
