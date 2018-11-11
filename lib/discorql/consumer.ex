defmodule Discorql.Consumer do
  use Nostrum.Consumer

  alias Nostrum.Api

  def start_link do
    Consumer.start_link(__MODULE__)
  end

  def handle_event({:MESSAGE_CREATE, {msg}, _ws}) do
    case msg.content do
      "!ping" ->
        Api.create_message(msg.channel_id, "pyongyang!")

      _ ->
        :ignore
    end
  end

  def handle_event({:READY, {_things}, _ws}) do
    IO.puts("READY!")
    Api.update_status(:online, "https://git.io/discorql")
  end

  def handle_event(_) do
    :noop
  end
end
