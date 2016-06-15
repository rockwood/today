defmodule Today.Mixfile do
  use Mix.Project

  def project do
    [app: :today,
     version: "0.0.1",
     elixir: "~> 1.2",
     escript: escript_config,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger]]
  end

  defp deps do
    []
  end

  defp escript_config do
    [main_module: Today.CLI]
  end
end
