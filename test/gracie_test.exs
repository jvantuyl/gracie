defmodule GracieTest do
  use ExUnit.Case
  doctest Gracie

  test "greets the world" do
    assert Gracie.hello() == :world
  end
end
