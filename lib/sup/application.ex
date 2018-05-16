defmodule Sup.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Sup.Scheduler
    ]

    opts = [strategy: :one_for_one, name: Sup.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
