defmodule Symphony do
  @moduledoc """
  # Symphony

  An Elixir client for [Orchestrate](https://orchestrate.io).
  """

  ## Preamble
  ##=======================================================================
  alias Symphony.HTTP, as: HTTP


  ## API
  ##=======================================================================
  def ping do
    headers = HTTP.headers
    url = HTTP.url

    case HTTPoison.head(url, headers) do
      {:ok, resp} ->
        case resp.status_code do
          200 ->
            :ok
          401 ->
            {:error, resp}
        end
      {:error, error} -> {error, :error}
    end
  end
end
