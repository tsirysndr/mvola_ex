defmodule MVola.Auth do
  @moduledoc """
  Documentation for `MVola.Auth`.
  """

  @doc """

  ## Examples

      iex> {:ok, res} = MVola.Auth.generate_token(consumer_key, consumer_secret, true)
      {:ok,
      %{
      "access_token" => "eyJ4NXQiOiJPRE5tWkRFMll6UTRNVEkxTVRZME1tSmhaR00yTUdWa1lUZGhOall5TWpnM01XTmpNalJqWWpnMll6bGpNRGRsWWpZd05ERmhZVGd6WkRoa1lUVm1OZyIsImtpZCI6Ik9ETm1aREUyWXpRNE1USTFNVFkwTW1KaFpHTTJNR1ZrWVRkaE5qWXlNamczTVdOak1qUmpZamcyWXpsak1EZGxZall3TkRGaFlUZ3paRGhrWVRWbU5nX1JTMjU2IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJ0c2lyeS5zbmRyQGdtYWlsLmNvbUBjYXJib24uc3VwZXIiLCJhdXQiOiJBUFBMSUNBVElPTiIsImF1ZCI6IlNSSHNaaWpFaGJoTktvMkhHUXFjMVNHQnZZRWEiLCJuYmYiOjE2NTE3ODA4MTUsImF6cCI6IlNSSHNaaWpFaGJoTktvMkhHUXFjMVNHQnZZRWEiLCJzY29wZSI6IkVYVF9JTlRfTVZPTEFfU0NPUEUiLCJpc3MiOiJodHRwczpcL1wvYXBpbS5wcmVwLnRlbG1hLm1nOjk0NDNcL29hdXRoMlwvdG9rZW4iLCJleHAiOjE2NTE3ODQ0MTUsImlhdCI6MTY1MTc4MDgxNSwianRpIjoiOTFiZWQ5OGEtNWY0Ni00ZmYzLWE4OTEtOWQyOWZiNmEzYzAxIn0.DTUOY-Hh6aKdptmFqV_WhmvJnw32Aw3tizdmI5KL4W_mLyuSoCzU0CVK_e-tDCsV4jZRl6IGiJ3v_iRc799cuvrtwdes2J43Hg5kOnpujMnGcERp6TDUG5E1vusFvhkPD1K1WOzo_dZvIPyL_9S5_IzWQ3WibBR9MiNpH1cYZrGBbTmxlbZMx-QdOgz8L4CtGKYnBomblE-14k5Mmn_V1GkASD6LEAp5-ilr4EzBZU5PB20FXv8NtAA_mjmaPkufMvw8-DxiHrpeOb5mFzQqvkD1g1mW47u6oKP9ICmCsFvlVM2hkPYGyjDtzoEcICzSMKuMpsHqJDLRx4B8Vw63Ug",
      "expires_in" => 3600,
      "scope" => "EXT_INT_MVOLA_SCOPE",
      "token_type" => "Bearer"
      }}

  """
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
