defmodule Gracie.SayHello do
  def init(req, opts) do
    Process.flag(:trap_exit, true)
    IO.puts("HANGING")
    :timer.sleep(10_000)
    IO.puts("UNHANGING")
    resp = :cowboy_req.reply(200, %{"content-type" => "text/plain"}, "Hello World!", req)
    {:ok, resp, opts}
  end
end
