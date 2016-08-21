defmodule Symphony.Config do
  @moduledoc """
  Convenience module for managing Symphony's configuration.
  """

  # Dynamically generate getters and setters
  [:api_key, :api_vsn, :base_url]
  |> Enum.each(
  fn(param) ->
    def unquote(param)(), do: Application.get_env(:symphony, unquote(param))
    def unquote(param)(val), do: Application.put_env(:symphony, unquote(param), val)
  end)
end
