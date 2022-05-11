defmodule MVola.Application do
  use Application

  def start(_type, args) do
    child_spec = case args do
      [env: :prod] -> [
        spec_http_client(),
      ]
      [env: :test] -> [
        spec_http_client(),
        {Plug.Cowboy, scheme: :http, plug: MVola.MockServer, options: [port: 8071]},
      ]
      [env: :dev] -> [spec_http_client(),]
      [_] -> [spec_http_client(),]
    end

    Supervisor.start_link(child_spec, strategy: :one_for_one, name: MVola.Supervisor)
  end

  def http_name() do
    __MODULE__.Finch
  end

  defp spec_http_client() do
    app = Application.get_application(__MODULE__)
    {
      Finch,
      pools: %{
        :default => [
          size: Application.get_env(app, :pool_size, 100),
          count: Application.get_env(app, :pool_count, 1)
        ]
      },
      name: http_name()
    }
  end
end
