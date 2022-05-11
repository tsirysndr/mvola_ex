defmodule MVola.MockServer do
  use Plug.Router
  plug Plug.Parsers, parsers: [:json],
  pass:  ["application/x-www-form-urlencoded", "application/json"],
  json_decoder: Poison

  plug :match
  plug :dispatch

  post "/token" do
    {:ok, data} = File.read(Path.expand("../../test/fixtures/auth_response.json", __DIR__))
    conn
    |> Plug.Conn.send_resp(200, data)
  end

  post "/mvola/mm/transactions/type/merchantpay/1.0.0/" do
    {:ok, data} = File.read(Path.expand("../../test/fixtures/transaction_response.json", __DIR__))
    conn
    |> Plug.Conn.send_resp(200, data)
  end

  get "/mvola/mm/transactions/type/merchantpay/1.0.0/:transaction_id" do
    {:ok, data} = File.read(Path.expand("../../test/fixtures/transaction_details.json", __DIR__))
    conn
    |> Plug.Conn.send_resp(200, data)
  end

  get "/mvola/mm/transactions/type/merchantpay/1.0.0/status/:server_correlation_id" do
    {:ok, data} = File.read(Path.expand("../../test/fixtures/transaction_status.json", __DIR__))
    conn
    |> Plug.Conn.send_resp(200, data)
  end

end
