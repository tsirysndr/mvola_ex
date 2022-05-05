defmodule MVola.Types.TransactionRequest do
  @type t() :: %__MODULE__{
          amount: integer(),
          currency: String.t(),
          description_text: String.t(),
          request_date: String.t(),
          debit_party: list(),
          credit_party: list(),
          metadata: map(),
          requesting_organisation_transaction_reference: String.t(),
          original_transaction_reference: String.t()
        }
  defstruct ~w[
    amount
    currency
    description_text
    request_date
    debit_party
    credit_party
    metadata
    requesting_organisation_transaction_reference
    original_transaction_reference
  ]a
end
