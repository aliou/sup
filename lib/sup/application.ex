defmodule Sup.Application do
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      Sup.Scheduler,
      {
        Plug.Adapters.Cowboy2,
        scheme: :http, plug: Sup.Router, options: [port: port()]
      }
    ]

    opts = [strategy: :one_for_one, name: Sup.Supervisor]
    Supervisor.start_link(children, opts)
  end

  defp port, do: (System.get_env("PORT") || "4000") |> String.to_integer
end
