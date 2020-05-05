defmodule Gracie do
  @moduledoc """
  Documentation for Gracie.
  """
  def trace do
    {:ok, _} = :dbg.tracer()
    :dbg.p(:all, :c)
    :dbg.tp(:supervisor, :terminate_child, [])
    :dbg.p(:new_processes, :r)
    :dbg.p(:new_processes, :s)
  end
end
