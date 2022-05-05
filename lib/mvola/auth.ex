defmodule MVola.Auth do
  def generate_token(consumer_key, consumer_secret) do
    generate_token(consumer_key, consumer_secret, false)
  end

  def generate_token(consumer_key, consumer_secret, is_sandbox) do
    {:ok, res} =
      MVola.Client.post(
        "/token",
        [
          {
            "Authorization",
            "Basic " <> Base.encode64(consumer_key <> ":" <> consumer_secret)
          },
          {
            "Content-Type",
            "application/x-www-form-urlencoded"
          },
          {
            "Accept",
            "application/json"
          }
        ],
        URI.encode_query(%{
          grant_type: "client_credentials",
          scope: "EXT_INT_MVOLA_SCOPE"
        }),
        is_sandbox
      )

    {:ok, res.body |> Jason.decode!()}
  end
end
