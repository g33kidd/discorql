defmodule DiscorqlWeb.Schema.CustomTypes do
  use Absinthe.Schema.Notation

  alias Nostrum.{Api, Struct.Snowflake}

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
end
