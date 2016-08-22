defmodule SymphonyTest do
  use ExUnit.Case, async: false
  doctest Symphony

  setup do
    Application.stop(:symphony)
    Application.unload(:symphony)
    :ok = Application.start(:symphony)
    api_key = System.get_env("ORCHESTRATE_API_KEY")
    Symphony.Config.api_key(api_key)
  end

  test "Invalid API key" do
    Symphony.Config.api_key("thisisaninvalidkey")
    {:error, resp} = Symphony.ping
    assert resp.status_code == 401
  end

  test "Valid API key" do
    assert Symphony.ping == :ok
  end

  test "Create a value (generated key)" do
    collection = "cities"
    value = %{"city" => "stockholm"}
    {:ok, _} = Symphony.KV.create(collection, value)
  end

  test "Create a value" do
    collection = "cities"
    key = "sthlm"
    value = %{"city" => "stockholm"}
    {:ok, _} = Symphony.KV.create(collection, key, value)
  end
end
