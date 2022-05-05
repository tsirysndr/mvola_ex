defmodule MVola.Types.Options do
  @type t() :: %__MODULE__{
          access_token: String.t(),
          version: String.t(),
          correlation_id: String.t(),
          user_language: String.t(),
          user_account_identifier: String.t(),
          partner_name: String.t(),
          callback_url: String.t()
        }
  defstruct ~w[
    access_token
    version
    correlation_id
    user_language
    user_account_identifier
    partner_name
    callback_url
  ]a
end
