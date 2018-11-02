defmodule DiscorqlWeb.Schema.UserTypes do
  use Absinthe.Schema.Notation

  object :user do
    field :id, :snowflake
    field :username, :string
    field :discriminator, :string
    field :avatar, :string
    field :bot, :boolean
    field :verified, :boolean
  end
end
