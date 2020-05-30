defmodule PingTest do
  use ExUnit.Case
  doctest Ping

  test "greets the world" do
    assert Ping.hello() == :world
  end
end
