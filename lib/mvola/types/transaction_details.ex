defmodule MVola.Types.TransactionDetails do
  @type t() :: %__MODULE__{
          amount: integer(),
          currency: String.t(),
          transaction_reference: String.t(),
          transaction_status: String.t(),
          creation_date: String.t(),
          request_date: String.t(),
          debit_party: list(),
          credit_party: list(),
          metadata: map(),
          fees: list()
        }
  defstruct ~w[
    amount
    currency
    transaction_reference
    transaction_status
    creation_date
    request_date
    debit_party
    credit_party
    metadata
    fees
  ]a
end
