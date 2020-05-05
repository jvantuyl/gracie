defmodule Gracie.Manager do
  use GenServer, shutdown: 15_000

  @listener_ref :test_listener

  def start_link(init_arg \\ nil, opts \\ [name: Grace.Manager]) do
    GenServer.start_link(__MODULE__, init_arg, opts)
  end

  @impl true
  def init(_init_arg) do
    Process.flag(:trap_exit, true)

    dispatch =
      :cowboy_router.compile([
        {:_, [{'/', Gracie.SayHello, []}]}
      ])

    :cowboy.start_clear(@listener_ref, %{socket_opts: [port: 8099], shutdown: 15_000}, %{env: %{dispatch: dispatch}, shutdown_timeout: 15_000})
    {:ok, nil}
  end

  @impl true
  def terminate(_reason, _state) do
    IO.puts("DYING")
    :timer.tc(:ranch, :stop_listener, [@listener_ref]) |> IO.inspect
    IO.puts("DEAD")
    :ignored
  end
end
