defmodule Sup.MixProject do
  use Mix.Project

  def project do
    [
      app: :sup,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      build_embedded: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Sup.Application, []}
    ]
  end

  defp deps do
    [
      # Web stuff
      {:plug, "~> 1.5.0"},
      {:cowboy, "~> 2.4.0"}
    ]
  end
end
