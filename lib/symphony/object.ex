defmodule Symphony.Object do
  @moduledoc """
  Symphony's internal object. This object is returned in response to
  most of the requests.
  """
  defstruct [:location, :etag]

  @doc """
  Creates a Symphony object out of a HTTP response.
  """
  def from_http_resp(resp) do
    {"Location", location} = List.keyfind(resp.headers, "Location", 0)
    {"ETag", etag} = List.keyfind(resp.headers, "ETag", 0)
    %Symphony.Object{:location => location, :etag => etag}
  end
end
