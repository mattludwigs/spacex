defmodule SpaceX.MixProject do
  use Mix.Project

  def project do
    [
      app: :spacex,
      version: "0.1.0",
      elixir: "~> 1.8",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      dialyzer: dialyzer(),
      docs: [extras: ["README.md"], main: "readme"],
      package: package(),
      description: description()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {SpaceX.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:mix_test_watch, "~> 0.5", only: :dev, runtime: false},
      {:dialyxir, "~> 1.0.0-rc.3", only: [:test, :dev], runtime: false},
      {:ex_doc, "~> 0.19", only: [:test, :dev], runtime: false},
      {:httpoison, "~> 1.5"},
      {:jason, "~> 1.1"}
    ]
  end

  defp dialyzer() do
    [
      flags: [:unmatched_returns, :error_handling, :race_conditions, :underspecs]
    ]
  end

  defp package do
    [
      maintainers: ["your name"],
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "some github"}
    ]
  end

  defp description() do
    "A description"
  end
end
