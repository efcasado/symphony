defmodule Symphony.KV do
  @moduledoc """
  Key/Value is core to Orchestrate.io. All other query types are built
  around this data type. Key/Value pairs are pieces of data identified
  by a unique key for a collection and have corresponding value.
  """

  ## Preamble
  ##=======================================================================
  alias Symphony.HTTP, as: HTTP
  alias Symphony.Object, as: Object

  ## API
  ##=======================================================================
  @doc """
  Creates the value in the collection specified, auto-generating a key for
  it. The new value will have its own unique version and that value will
  always be retrievable at its fully qualified 'ref' location.
  """
  def create(collection, value) do
    headers = HTTP.headers
    url = HTTP.url([collection], [])

    body = Poison.encode!(value)
    case HTTPoison.post(url, body, headers) do
      {:ok, resp} ->
        case resp.status_code do
          201 ->
            obj = Object.from_http_resp(resp)
            {:ok, obj}
          _ ->
            {:error, resp}
        end
      {:error, error} -> {error, :error}
    end
  end

  @doc """
  Creates or updates the value at the collection/key specified. The new
  value will have its own unique version and that value will always be
  retrievable at its fully qualified 'ref' location.
  """
  def create(collection, key, value) do
    headers = HTTP.headers
    url = HTTP.url([collection, key], [])

    body = Poison.encode!(value)
    case HTTPoison.put(url, body, headers) do
      {:ok, resp} ->
        case resp.status_code do
          201 ->
            obj = Object.from_http_resp(resp)
            {:ok, obj}
          _ ->
            {:error, resp}
        end
      {:error, error} -> {error, :error}
    end
  end
end
