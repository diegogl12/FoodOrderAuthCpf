defmodule AuthCpf.MixProject do
  use Mix.Project

  def project do
    [
      app: :auth_cpf,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {AuthCpf.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:plug_cowboy, "~> 2.7.3"},
      {:tesla, "~> 1.14"},
      {:jason, "~> 1.4.4"},
      {:mint, "~> 1.0"}
    ]
  end
end

