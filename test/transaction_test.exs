defmodule MVola.TransactionTest do
  use Assertions.Case

  test "get transaction details" do
    {:ok, expected} = File.read(Path.expand("fixtures/transaction_details.json", __DIR__))
    options = %{
      access_token: "ACCESS TOKEN",
      version: "1.0",
       correlation_id: "8220e86b-f4e2-4dab-b261-0fc89731227d",
       user_language: "FR",
       user_account_identifier: "msisdn;0343500003",
       partner_name: "TestMVola",
       callback_url: ""
    }
    {:ok, res} = MVola.Transaction.get_transaction_details("636042511", options)
    assert_maps_equal(res, Jason.decode!(expected), [
      :amount,
      :currency,
      :transactionReference,
      :transactionStatus,
      :creationDate,
      :requestDate,
    ])
  end

  test "get transaction status" do
    {:ok, expected} = File.read(Path.expand("fixtures/transaction_status.json", __DIR__))
    options = %{
      access_token: "ACCESS TOKEN",
      version: "1.0",
      correlation_id: "b6f77ff7-e1f7-4aea-b6e7-354d8651d55a",
      user_language: "FR",
      user_account_identifier: "msisdn;0343500003",
      partner_name: "TestMVola",
      callback_url: ""
    }
    {:ok, res} = MVola.Transaction.get_transaction_status("d4150b04-609d-4f04-b12e-6fde9298cf14", options)
    assert_maps_equal(res, Jason.decode!(expected), [
      :status,
      :serverCorrelationId,
      :notificationMethod,
      :objectReference
    ])
  end

  test "send payment" do
    {:ok, expected} = File.read(Path.expand("fixtures/transaction_response.json", __DIR__))
    options = %{
      access_token: "ACCESS TOKEN",
      version: "1.0",
      correlation_id: "8a01cc13-6d97-4230-9293-434b6b2a928",
      user_language: "FR",
      user_account_identifier: "msisdn;0343500003",
      partner_name: "TestMVola",
      callback_url: ""
    }
    tx = %{
      amount: "10000",
      currency: "Ar",
      descriptionText: "test",
      requestDate: "2022-05-11T08:20:28.495Z",
      debitParty: [%{key: "msisdn", value: "0343500003"}],
      creditParty: [%{key: "msisdn", value: "0343500004"}],
      metadata:  [
        %{key: "partnerName", value: "TestMVola"},
        %{key: "fc", value: "USD"}, %{key: "amountFc", value: "1"}
      ],
      requestingOrganisationTransactionReference: "fd4d2394-ab39-4ddf-8aba-af319fd04607",
      originalTransactionReference: "fd4d2394-ab39-4ddf-8aba-af319fd04607"
    }
    {:ok, res} = MVola.Transaction.send_payment(Jason.encode!(tx), options)
    assert_maps_equal(res, Jason.decode!(expected), [
      :status,
      :serverCorrelationId,
      :notificationMethod
    ])
  end
end
