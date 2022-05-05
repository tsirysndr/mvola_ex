defmodule MVola.Types.TransactionResponse do
  @type t() :: %__MODULE__{
          status: String.t(),
          server_correlation_id: String.t(),
          notification_method: String.t()
        }
  defstruct ~w[
    status
    server_correlation_id
    notification_method
  ]a
end
