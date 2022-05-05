defmodule MVola.Types.AuthRequest do
  @type t() :: %__MODULE__{
          grant_type: String.t(),
          client_id: String.t()
        }
  defstruct ~w[
    grant_type
    client_id
  ]a
end
