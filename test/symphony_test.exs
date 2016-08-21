defmodule SymphonyTest do
  use ExUnit.Case, async: false
  doctest Symphony

  setup do
    Application.stop(:symphony)
    Application.unload(:symphony)
    :ok = Application.start(:symphony)
  end

  test "ping" do
    assert Symphony.ping == :ok
  end
end
