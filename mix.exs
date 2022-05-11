defmodule Mvola.MixProject do
  use Mix.Project

  def project do
    [
      app: :mvola,
      version: "0.2.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.json": :test
      ],
      description: description(),
      package: package(),

      # Docs
      name: "MVola",
      source_url: "https://github.com/tsirysndr/mvola_ex",
      docs: [
        # The main page in the docs
        main: "readme",
        extras: ["README.md"]
      ]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger, :telemetry],
      mod: {MVola.Application, [env: Mix.env]},
      applications: applications(Mix.env)
    ]
  end

  defp applications(:test), do: applications(:default) ++ [:cowboy, :plug]
  defp applications(_),     do: [:httpoison]

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:assertions, "~> 0.19.0", only: :test},
      {:finch, "~> 0.11.0"},
      {:jason, "~> 1.3"},
      {:ex_doc, "~> 0.27", only: :dev, runtime: false},
      {:mock, "~> 0.3.0", only: :test},
      {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
      {:httpoison, "~> 1.0"},
      {:plug_cowboy, "~> 2.0"},
      {:poison, "~> 5.0"},
      {:excoveralls, "~> 0.10", only: :test},
    ]
  end

  defp description() do
    "Elixir library for the Mvola API"
  end

  defp package() do
    [
      # This option is only needed when you don't want to use the OTP application name
      name: "mvola",
      # These are the default files included in the package
      files: ~w(lib mix.exs README* LICENSE*),
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/tsirysndr/mvola_ex"}
    ]
  end
end
