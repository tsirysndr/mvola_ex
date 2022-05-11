defmodule MVola.Transaction do
  @moduledoc """
  Documentation for `MVola.Transaction`.
  """

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

  @doc """

  ## Examples

      iex> consumer_key = "YOUR CONSUMER KEY"
      iex> consumer_secret = "YOUR CONSUMER SECRET"
      iex> {:ok, res} = MVola.Auth.generate_token(consumer_key, consumer_secret)
      {:ok,
      %{
        "access_token" => "eyJ4NXQiOiJPRE5tWkRFMll6UTRNVEkxTVRZME1tSmhaR00yTUdWa1lUZGhOall5TWpnM01XTmpNalJqWWpnMll6bGpNRGRsWWpZd05ERmhZVGd6WkRoa1lUVm1OZyIsImtpZCI6Ik9ETm1aREUyWXpRNE1USTFNVFkwTW1KaFpHTTJNR1ZrWVRkaE5qWXlNamczTVdOak1qUmpZamcyWXpsak1EZGxZall3TkRGaFlUZ3paRGhrWVRWbU5nX1JTMjU2IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJ0c2lyeS5zbmRyQGdtYWlsLmNvbUBjYXJib24uc3VwZXIiLCJhdXQiOiJBUFBMSUNBVElPTiIsImF1ZCI6IlNSSHNaaWpFaGJoTktvMkhHUXFjMVNHQnZZRWEiLCJuYmYiOjE2NTE3NzkxNTYsImF6cCI6IlNSSHNaaWpFaGJoTktvMkhHUXFjMVNHQnZZRWEiLCJzY29wZSI6IkVYVF9JTlRfTVZPTEFfU0NPUEUiLCJpc3MiOiJodHRwczpcL1wvYXBpbS5wcmVwLnRlbG1hLm1nOjk0NDNcL29hdXRoMlwvdG9rZW4iLCJleHAiOjE2NTE3ODI3NTYsImlhdCI6MTY1MTc3OTE1NiwianRpIjoiMjdiZjI3NzEtZTEzYy00ODVlLTg0YzQtYTIwMGRhZWRiNGQ2In0.Ei-ZVCaBNYjbzZ2vtLzgXw4JJ6DJwIz7jzkC_s2B4WtgB7cOLWqAh_6CiPp9P_4FOPzNkmlqKksziZREuEuzG0VXiB-4P9kHU7Wvt-83rzg3Qf2qSJkPS0ZlFV3P36msPdR5ziB3RQpfK0XMWHwKBfmWsTzxNqFQ05RomaCTSmaix5XAtkT0Jfij_RylKyuUo0yWQURMUf8Ndgo5PXFHmJuAjtwfk8WZ88VGFLN6qAPlwlaOTTGQHga6CKTtr-QyLhicZkK5Qo1UqfX5-RYLzHjoQWIRU1lUPg4J3KfK2vowgmgrJsU8OidA29xIzGD3HsR84zDomD3TB4EpkRSUoQ",
        "expires_in" => 3600,
        "scope" => "EXT_INT_MVOLA_SCOPE",
        "token_type" => "Bearer"
      }}
      iex> options = %{access_token: Map.get(res, "access_token"), version: "1.0", correlation_id: "qwerttyyuuuui", user_language: "FR", user_account_identifier: "msisdn;0343500003", partner_name: "TestMVola", callback_url: ""}
      %{
        access_token: "eyJ4NXQiOiJPRE5tWkRFMll6UTRNVEkxTVRZME1tSmhaR00yTUdWa1lUZGhOall5TWpnM01XTmpNalJqWWpnMll6bGpNRGRsWWpZd05ERmhZVGd6WkRoa1lUVm1OZyIsImtpZCI6Ik9ETm1aREUyWXpRNE1USTFNVFkwTW1KaFpHTTJNR1ZrWVRkaE5qWXlNamczTVdOak1qUmpZamcyWXpsak1EZGxZall3TkRGaFlUZ3paRGhrWVRWbU5nX1JTMjU2IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJ0c2lyeS5zbmRyQGdtYWlsLmNvbUBjYXJib24uc3VwZXIiLCJhdXQiOiJBUFBMSUNBVElPTiIsImF1ZCI6IlNSSHNaaWpFaGJoTktvMkhHUXFjMVNHQnZZRWEiLCJuYmYiOjE2NTE3NzkxNTYsImF6cCI6IlNSSHNaaWpFaGJoTktvMkhHUXFjMVNHQnZZRWEiLCJzY29wZSI6IkVYVF9JTlRfTVZPTEFfU0NPUEUiLCJpc3MiOiJodHRwczpcL1wvYXBpbS5wcmVwLnRlbG1hLm1nOjk0NDNcL29hdXRoMlwvdG9rZW4iLCJleHAiOjE2NTE3ODI3NTYsImlhdCI6MTY1MTc3OTE1NiwianRpIjoiMjdiZjI3NzEtZTEzYy00ODVlLTg0YzQtYTIwMGRhZWRiNGQ2In0.Ei-ZVCaBNYjbzZ2vtLzgXw4JJ6DJwIz7jzkC_s2B4WtgB7cOLWqAh_6CiPp9P_4FOPzNkmlqKksziZREuEuzG0VXiB-4P9kHU7Wvt-83rzg3Qf2qSJkPS0ZlFV3P36msPdR5ziB3RQpfK0XMWHwKBfmWsTzxNqFQ05RomaCTSmaix5XAtkT0Jfij_RylKyuUo0yWQURMUf8Ndgo5PXFHmJuAjtwfk8WZ88VGFLN6qAPlwlaOTTGQHga6CKTtr-QyLhicZkK5Qo1UqfX5-RYLzHjoQWIRU1lUPg4J3KfK2vowgmgrJsU8OidA29xIzGD3HsR84zDomD3TB4EpkRSUoQ",
        callback_url: "",
        correlation_id: "qwerttyyuuuui",
        partner_name: "TestMVola",
        user_account_identifier: "msisdn;0343500003",
        user_language: "FR",
        version: "1.0"
      }
      iex> MVola.Transaction.get_transaction_details("636042511", options)
      {:ok,
        %{
        "amount" => "10000.00",
        "creationDate" => "2022-05-03T18:09:10.391Z",
        "creditParty" => [%{"key" => "msisdn", "value" => "0343500004"}],
        "currency" => "Ar",
        "debitParty" => [%{"key" => "msisdn", "value" => "0343500003"}],
        "fees" => [%{"feeAmount" => "150"}],
        "metadata" => [
          %{"key" => "originalTransactionResult", "value" => "0"},
          %{"key" => "originalTransactionResultDesc", "value" => "0"}
        ],
        "requestDate" => "2022-05-05T19:33:11.462Z",
        "transactionReference" => "636057584",
        "transactionStatus" => "completed"
        }}

  """
  def get_transaction_details(transaction_id, options) do
    {:ok, res} = MVola.Client.get(endpoint(transaction_id), headers(options))
    {:ok, res.body |> Jason.decode!()}
  end

  @doc """

  ## Examples

      iex> consumer_key = "YOUR CONSUMER KEY"
      iex> consumer_secret = "YOUR CONSUMER SECRET"
      iex> {:ok, res} = MVola.Auth.generate_token(consumer_key, consumer_secret)
      {:ok,
      %{
        "access_token" => "eyJ4NXQiOiJPRE5tWkRFMll6UTRNVEkxTVRZME1tSmhaR00yTUdWa1lUZGhOall5TWpnM01XTmpNalJqWWpnMll6bGpNRGRsWWpZd05ERmhZVGd6WkRoa1lUVm1OZyIsImtpZCI6Ik9ETm1aREUyWXpRNE1USTFNVFkwTW1KaFpHTTJNR1ZrWVRkaE5qWXlNamczTVdOak1qUmpZamcyWXpsak1EZGxZall3TkRGaFlUZ3paRGhrWVRWbU5nX1JTMjU2IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJ0c2lyeS5zbmRyQGdtYWlsLmNvbUBjYXJib24uc3VwZXIiLCJhdXQiOiJBUFBMSUNBVElPTiIsImF1ZCI6IlNSSHNaaWpFaGJoTktvMkhHUXFjMVNHQnZZRWEiLCJuYmYiOjE2NTE3NzkxNTYsImF6cCI6IlNSSHNaaWpFaGJoTktvMkhHUXFjMVNHQnZZRWEiLCJzY29wZSI6IkVYVF9JTlRfTVZPTEFfU0NPUEUiLCJpc3MiOiJodHRwczpcL1wvYXBpbS5wcmVwLnRlbG1hLm1nOjk0NDNcL29hdXRoMlwvdG9rZW4iLCJleHAiOjE2NTE3ODI3NTYsImlhdCI6MTY1MTc3OTE1NiwianRpIjoiMjdiZjI3NzEtZTEzYy00ODVlLTg0YzQtYTIwMGRhZWRiNGQ2In0.Ei-ZVCaBNYjbzZ2vtLzgXw4JJ6DJwIz7jzkC_s2B4WtgB7cOLWqAh_6CiPp9P_4FOPzNkmlqKksziZREuEuzG0VXiB-4P9kHU7Wvt-83rzg3Qf2qSJkPS0ZlFV3P36msPdR5ziB3RQpfK0XMWHwKBfmWsTzxNqFQ05RomaCTSmaix5XAtkT0Jfij_RylKyuUo0yWQURMUf8Ndgo5PXFHmJuAjtwfk8WZ88VGFLN6qAPlwlaOTTGQHga6CKTtr-QyLhicZkK5Qo1UqfX5-RYLzHjoQWIRU1lUPg4J3KfK2vowgmgrJsU8OidA29xIzGD3HsR84zDomD3TB4EpkRSUoQ",
        "expires_in" => 3600,
        "scope" => "EXT_INT_MVOLA_SCOPE",
        "token_type" => "Bearer"
      }}
      iex> options = %{access_token: Map.get(res, "access_token"), version: "1.0", correlation_id: "qwerttyyuuuui", user_language: "FR", user_account_identifier: "msisdn;0343500003", partner_name: "TestMVola", callback_url: ""}
      %{
        access_token: "eyJ4NXQiOiJPRE5tWkRFMll6UTRNVEkxTVRZME1tSmhaR00yTUdWa1lUZGhOall5TWpnM01XTmpNalJqWWpnMll6bGpNRGRsWWpZd05ERmhZVGd6WkRoa1lUVm1OZyIsImtpZCI6Ik9ETm1aREUyWXpRNE1USTFNVFkwTW1KaFpHTTJNR1ZrWVRkaE5qWXlNamczTVdOak1qUmpZamcyWXpsak1EZGxZall3TkRGaFlUZ3paRGhrWVRWbU5nX1JTMjU2IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJ0c2lyeS5zbmRyQGdtYWlsLmNvbUBjYXJib24uc3VwZXIiLCJhdXQiOiJBUFBMSUNBVElPTiIsImF1ZCI6IlNSSHNaaWpFaGJoTktvMkhHUXFjMVNHQnZZRWEiLCJuYmYiOjE2NTE3NzkxNTYsImF6cCI6IlNSSHNaaWpFaGJoTktvMkhHUXFjMVNHQnZZRWEiLCJzY29wZSI6IkVYVF9JTlRfTVZPTEFfU0NPUEUiLCJpc3MiOiJodHRwczpcL1wvYXBpbS5wcmVwLnRlbG1hLm1nOjk0NDNcL29hdXRoMlwvdG9rZW4iLCJleHAiOjE2NTE3ODI3NTYsImlhdCI6MTY1MTc3OTE1NiwianRpIjoiMjdiZjI3NzEtZTEzYy00ODVlLTg0YzQtYTIwMGRhZWRiNGQ2In0.Ei-ZVCaBNYjbzZ2vtLzgXw4JJ6DJwIz7jzkC_s2B4WtgB7cOLWqAh_6CiPp9P_4FOPzNkmlqKksziZREuEuzG0VXiB-4P9kHU7Wvt-83rzg3Qf2qSJkPS0ZlFV3P36msPdR5ziB3RQpfK0XMWHwKBfmWsTzxNqFQ05RomaCTSmaix5XAtkT0Jfij_RylKyuUo0yWQURMUf8Ndgo5PXFHmJuAjtwfk8WZ88VGFLN6qAPlwlaOTTGQHga6CKTtr-QyLhicZkK5Qo1UqfX5-RYLzHjoQWIRU1lUPg4J3KfK2vowgmgrJsU8OidA29xIzGD3HsR84zDomD3TB4EpkRSUoQ",
        callback_url: "",
        correlation_id: "qwerttyyuuuui",
        partner_name: "TestMVola",
        user_account_identifier: "msisdn;0343500003",
        user_language: "FR",
        version: "1.0"
      }
      iex> MVola.Transaction.get_transaction_status("d4150b04-609d-4f04-b12e-6fde9298cf14", options)
      {:ok,                                                                                                                                                     %{
        "notificationMethod" => "callback",
        "objectReference" => "",
        "serverCorrelationId" => "d4150b04-609d-4f04-b12e-6fde9298cf14",
        "status" => "failed"
      }}
  """
  def get_transaction_status(server_correlation_id, options) do
    {:ok, res} =
      MVola.Client.get(endpoint("/status/" <> server_correlation_id), headers(options))

    {:ok, res.body |> Jason.decode!()}
  end

  @doc """

  ## Examples

      iex> consumer_key = "YOUR CONSUMER KEY"
      iex> consumer_secret = "YOUR CONSUMER SECRET"
      iex> {:ok, res} = MVola.Auth.generate_token(consumer_key, consumer_secret)
      {:ok,
      %{
        "access_token" => "eyJ4NXQiOiJPRE5tWkRFMll6UTRNVEkxTVRZME1tSmhaR00yTUdWa1lUZGhOall5TWpnM01XTmpNalJqWWpnMll6bGpNRGRsWWpZd05ERmhZVGd6WkRoa1lUVm1OZyIsImtpZCI6Ik9ETm1aREUyWXpRNE1USTFNVFkwTW1KaFpHTTJNR1ZrWVRkaE5qWXlNamczTVdOak1qUmpZamcyWXpsak1EZGxZall3TkRGaFlUZ3paRGhrWVRWbU5nX1JTMjU2IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJ0c2lyeS5zbmRyQGdtYWlsLmNvbUBjYXJib24uc3VwZXIiLCJhdXQiOiJBUFBMSUNBVElPTiIsImF1ZCI6IlNSSHNaaWpFaGJoTktvMkhHUXFjMVNHQnZZRWEiLCJuYmYiOjE2NTE3NzkxNTYsImF6cCI6IlNSSHNaaWpFaGJoTktvMkhHUXFjMVNHQnZZRWEiLCJzY29wZSI6IkVYVF9JTlRfTVZPTEFfU0NPUEUiLCJpc3MiOiJodHRwczpcL1wvYXBpbS5wcmVwLnRlbG1hLm1nOjk0NDNcL29hdXRoMlwvdG9rZW4iLCJleHAiOjE2NTE3ODI3NTYsImlhdCI6MTY1MTc3OTE1NiwianRpIjoiMjdiZjI3NzEtZTEzYy00ODVlLTg0YzQtYTIwMGRhZWRiNGQ2In0.Ei-ZVCaBNYjbzZ2vtLzgXw4JJ6DJwIz7jzkC_s2B4WtgB7cOLWqAh_6CiPp9P_4FOPzNkmlqKksziZREuEuzG0VXiB-4P9kHU7Wvt-83rzg3Qf2qSJkPS0ZlFV3P36msPdR5ziB3RQpfK0XMWHwKBfmWsTzxNqFQ05RomaCTSmaix5XAtkT0Jfij_RylKyuUo0yWQURMUf8Ndgo5PXFHmJuAjtwfk8WZ88VGFLN6qAPlwlaOTTGQHga6CKTtr-QyLhicZkK5Qo1UqfX5-RYLzHjoQWIRU1lUPg4J3KfK2vowgmgrJsU8OidA29xIzGD3HsR84zDomD3TB4EpkRSUoQ",
        "expires_in" => 3600,
        "scope" => "EXT_INT_MVOLA_SCOPE",
        "token_type" => "Bearer"
      }}
      iex> options = %{access_token: Map.get(res, "access_token"), version: "1.0", correlation_id: "8a01cc13-6d97-4230-9293-434b6b2a928", user_language: "FR", user_account_identifier: "msisdn;0343500003", partner_name: "TestMVola", callback_url: ""}
      %{
        access_token: "eyJ4NXQiOiJPRE5tWkRFMll6UTRNVEkxTVRZME1tSmhaR00yTUdWa1lUZGhOall5TWpnM01XTmpNalJqWWpnMll6bGpNRGRsWWpZd05ERmhZVGd6WkRoa1lUVm1OZyIsImtpZCI6Ik9ETm1aREUyWXpRNE1USTFNVFkwTW1KaFpHTTJNR1ZrWVRkaE5qWXlNamczTVdOak1qUmpZamcyWXpsak1EZGxZall3TkRGaFlUZ3paRGhrWVRWbU5nX1JTMjU2IiwiYWxnIjoiUlMyNTYifQ.eyJzdWIiOiJ0c2lyeS5zbmRyQGdtYWlsLmNvbUBjYXJib24uc3VwZXIiLCJhdXQiOiJBUFBMSUNBVElPTiIsImF1ZCI6IlNSSHNaaWpFaGJoTktvMkhHUXFjMVNHQnZZRWEiLCJuYmYiOjE2NTE3NzkxNTYsImF6cCI6IlNSSHNaaWpFaGJoTktvMkhHUXFjMVNHQnZZRWEiLCJzY29wZSI6IkVYVF9JTlRfTVZPTEFfU0NPUEUiLCJpc3MiOiJodHRwczpcL1wvYXBpbS5wcmVwLnRlbG1hLm1nOjk0NDNcL29hdXRoMlwvdG9rZW4iLCJleHAiOjE2NTE3ODI3NTYsImlhdCI6MTY1MTc3OTE1NiwianRpIjoiMjdiZjI3NzEtZTEzYy00ODVlLTg0YzQtYTIwMGRhZWRiNGQ2In0.Ei-ZVCaBNYjbzZ2vtLzgXw4JJ6DJwIz7jzkC_s2B4WtgB7cOLWqAh_6CiPp9P_4FOPzNkmlqKksziZREuEuzG0VXiB-4P9kHU7Wvt-83rzg3Qf2qSJkPS0ZlFV3P36msPdR5ziB3RQpfK0XMWHwKBfmWsTzxNqFQ05RomaCTSmaix5XAtkT0Jfij_RylKyuUo0yWQURMUf8Ndgo5PXFHmJuAjtwfk8WZ88VGFLN6qAPlwlaOTTGQHga6CKTtr-QyLhicZkK5Qo1UqfX5-RYLzHjoQWIRU1lUPg4J3KfK2vowgmgrJsU8OidA29xIzGD3HsR84zDomD3TB4EpkRSUoQ",
        callback_url: "",
        correlation_id: "8a01cc13-6d97-4230-9293-434b6b2a928",
        partner_name: "TestMVola",
        user_account_identifier: "msisdn;0343500003",
        user_language: "FR",
        version: "1.0"
      }
      iex> tx = %{ amount: "1000", currency: "Ar", descriptionText: "test", requestDate: now <> "Z", debitParty: [%{key: "msisdn", value: "0343500003"}], creditParty: [%{key: "msisdn", value: "0343500004"}], metadata:  [%{key: "partnerName", value: "TestMVola"}, %{key: "fc", value: "USD"}, %{key: "amountFc", value: "1"}], requestingOrganisationTransactionReference: "fd4d2394-ab39-4ddf-8aba-af319fd04607", originalTransactionReference: "fd4d2394-ab39-4ddf-8aba-af319fd04607" }
      %{
        amount: "1000",
        creditParty: [%{key: "msisdn", value: "0343500004"}],
        currency: "Ar",
        debitParty: [%{key: "msisdn", value: "0343500003"}],
        descriptionText: "test",
        metadata: [
          %{key: "partnerName", value: "TestMVola"},
          %{key: "fc", value: "USD"},
          %{key: "amountFc", value: "1"}
        ],
        originalTransactionReference: "fd4d2394-ab39-4ddf-8aba-af319fd04607",
        requestDate: "2022-05-05T20:00:30.068Z",
        requestingOrganisationTransactionReference: "fd4d2394-ab39-4ddf-8aba-af319fd04607"
      }
      iex> MVola.Transaction.send_payment(Jason.encode!(tx), options)
      {:ok,
      %{                                                                                                                                               %{
        "notificationMethod" => "callback",
        "serverCorrelationId" => "d4150b04-609d-4f04-b12e-6fde9298cf14",
        "status" => "pending"
      }}

  """
  def send_payment(tx, options) do
    {:ok, res} = MVola.Client.post(endpoint(), headers(options), tx)
    {:ok, res.body |> Jason.decode!()}
  end
end
