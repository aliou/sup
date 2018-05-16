defmodule Sup.Scheduler do
  require Logger
  use GenServer

  @one_minute 60 * 1000

  def start_link, do: GenServer.start_link(__MODULE__, %{})

  def init(state) do
    schedule_job()
    {:ok, state}
  end

  def child_spec(_args) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, []},
      restart: :permanent,
      shutdown: 5000,
      type: :worker
    }
  end

  def handle_info(:job, state) do
    Logger.info("sup, it's #{DateTime.utc_now()}.")
    schedule_job()
    {:noreply, state}
  end

  defp schedule_job do
    # Every ten minutes
    Process.send_after(self(), :job, 10 * @one_minute)
  end
end
