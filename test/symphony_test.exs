defmodule SymphonyTest do
  use ExUnit.Case
  doctest Symphony

  setup do
    Application.stop(:symphony)
    :ok = Application.start(:symphony)
  end

  test "ping" do
    assert Symphony.ping == :ok
  end
end
