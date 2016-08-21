defmodule Symphony do
  @moduledoc """
  # Symphony

  An Elixir client for [Orchestrate](https://orchestrate.io).
  """

  alias Symphony.HTTP, as: HTTP


  ## API
  ##=======================================================================
  def ping do
    headers = HTTP.headers
    url = HTTP.url

    case HTTPoison.head(url, headers) do
      {:ok, _} -> :ok
      error    -> error
    end
  end
end
