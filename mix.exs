defmodule Spry.MixProject do
  use Mix.Project

  @version "0.2.1"
  @repo_url "https://github.com/Miserlou/Spry"

  def project do
    [
      app: :spry,
      name: "Spry",
      description: "Slightly enhanced `pry` for Elixir and LiveView",
      version: @version,
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps()
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
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
      # {:useful, "~> 0.4.0"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end

  defp package do
    [
      files: ["lib/spry.ex", "priv", "mix.exs", "README.md"],
      maintainers: ["Rich Jones"],
      licenses: ["MIT"],
      links: %{"GitHub" => @repo_url}
    ]
  end

end
