defmodule Ping.MixProject do
  use Mix.Project

  def project do
    [
      app: :ping,
      version: "1.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      description: "ping lets you ping your app to wake it",
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ]
    ]
  end

  defp package() do
    [
      files: ~w(lib/ping.ex LICENSE mix.exs README.md),
      name: "ping",
      licenses: ["GNU GPL v2.0"],
      maintainers: ["dwyl"],
      links: %{"GitHub" => "https://github.com/dwyl/ping"}
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # Plug helper functions: github.com/elixir-plug/plug
      {:plug, "~> 1.12.1"},

      # Testing Wildcard Route Handler in a Phoenix App:
      {:jason, "~> 1.2.2", only: [:dev, :test]},
      {:phoenix, "~> 1.6.0", only: [:dev, :test]},

      # Track coverage: github.com/parroty/excoveralls
      {:excoveralls, "~> 0.14.3", only: :test},

      # For publishing Hex.docs:
      {:ex_doc, "~> 0.25.3", only: :dev}
    ]
  end
end
