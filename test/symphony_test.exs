defmodule SymphonyTest do
  use ExUnit.Case, async: false
  doctest Symphony

  setup do
    Application.stop(:symphony)
    Application.unload(:symphony)
    :ok = Application.start(:symphony)
  end

  test "Invalid API key" do
    {:error, resp} = Symphony.ping
    assert resp.status_code == 401
  end

  test "Valid API key" do
    api_key = System.get_env("ORCHESTRATE_API_KEY")
    Symphony.Config.api_key(api_key)
    assert Symphony.ping == :ok
  end
end
