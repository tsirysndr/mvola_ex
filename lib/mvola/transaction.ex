defmodule MVola.Transaction do
  defp endpoint(params) do
    "/mvola/mm/transactions/type/merchantpay/1.0.0/" <> params
  end

  defp endpoint() do
    "/mvola/mm/transactions/type/merchantpay/1.0.0/"
  end

  defp headers(options) do
    [
      {
        "Authorization",
        "Bearer " <> options.access_token
      },
      {
        "Version",
        options.version
      },
      {
        "X-CorrelationID",
        options.correlation_id
      },
      {
        "UserLanguage",
        options.user_language
      },
      {
        "UserAccountIdentifier",
        options.user_account_identifier
      },
      {
        "PartnerName",
        options.partner_name
      },
      {
        "X-Callback-URL",
        options.callback_url
      },
      {
        "Cache-Control",
        "no-cache"
      },
      {
        "Content-Type",
        "application/json"
      }
    ]
  end

  def get_transaction_details(transaction_id, options) do
    {:ok, res} = MVola.Client.get(endpoint(transaction_id), headers(options), true)
    {:ok, res.body |> Jason.decode!()}
  end

  def get_transaction_status(server_correlation_id, options) do
    {:ok, res} = MVola.Client.get(endpoint("/status/" <> server_correlation_id), headers(options), true)
    {:ok, res.body |> Jason.decode!()}
  end

  def send_payment(tx, options) do
    {:ok, res} = MVola.Client.post(endpoint(), headers(options), tx, true)
    {:ok, res.body |> Jason.decode!()}
  end
end
