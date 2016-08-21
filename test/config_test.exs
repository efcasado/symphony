defmodule SymphonyConfigTest do
  use ExUnit.Case, async: false
  doctest Symphony

  test "Read defaut :api_key" do
    assert Symphony.Config.api_key == "itsasecret"
  end

  test "Read defaut :api_vsn" do
    assert Symphony.Config.api_vsn == "v0"
  end

  test "Read defaut :base_url" do
    assert Symphony.Config.base_url == "https://api.orchestrate.io/"
  end

  test "Set :api_key" do
    Symphony.Config.api_key("thisisanewapikey")
    assert Symphony.Config.api_key == "thisisanewapikey"
  end

  test "Set :api_vsn" do
    Symphony.Config.api_vsn("v1")
    assert Symphony.Config.api_vsn == "v1"
  end

  test "Set :base_url" do
    Symphony.Config.base_url("http://newbaseurl.com/")
    assert Symphony.Config.base_url == "http://newbaseurl.com/"
  end
end
