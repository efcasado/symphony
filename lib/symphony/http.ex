defmodule Symphony.HTTP do
  @moduledoc """
  Convenience module for managing HTTP-related options
  """

  alias Symphony.Config, as: Config


  ## Exported functions
  ##=======================================================================
  def url() do
    _url()
  end

  def url(segments, query) do
    uri = URI.parse(_url())

    uri =
      case segments do
        [] -> uri
        _  -> %{uri | path: Path.join([uri.path| segments])}
      end
    uri =
      case query do
        [] -> uri
        _  -> %{uri | query: URI.encode_query(query)}
      end

    URI.to_string(uri)
  end

  def headers() do
    _headers()
  end

  ## Local functions
  ##=======================================================================
  defp _url() do
    api_vsn = Config.api_vsn
    base_url = Config.base_url

    base_url = URI.merge(base_url, api_vsn)

    base_url
    |> to_string
  end

  defp _headers() do
    [
      auth_header(),
      {"Accept", "application/json"},
      {"Content-Type", "application/json"}
    ]
  end

  defp auth_header() do
    api_key = Config.api_key
    api_key = Base.encode64(api_key)
    {"Authorization", "Basic #{api_key}"}
  end
end
