defmodule Symphony.Mixfile do
  use Mix.Project

  def project do
    [app: :symphony,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     preferred_cli_env: ["coveralls": :test,
                         "coveralls.detail": :test,
                         "coveralls.post": :test,
                         "coveralls.html": :test
                        ],
     test_coverage: [tool: ExCoveralls]
    ]
  end

  def application do
    [env: [api_key: "itsasecret",
           api_vsn: "v0",
           base_url: "https://api.orchestrate.io/"
          ],
     applications: [:httpoison,
                    :logger
                   ]
    ]
  end

  defp deps do
    [
      {:httpoison, "~> 0.9.0"},
      # Test dependencies
      {:credo, "~> 0.4", only: [:dev, :test]},
      {:excoveralls, "~> 0.5", only: :test}
    ]
  end
end
