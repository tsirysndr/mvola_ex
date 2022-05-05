defmodule MVola.Types.AuthResponse do
  @type t() :: %__MODULE__{
          access_token: String.t(),
          token_type: String.t(),
          expires_in: integer(),
          scope: String.t()
        }
  defstruct ~w[
    access_token
    token_type
    expires_in
    scope
  ]a
end
