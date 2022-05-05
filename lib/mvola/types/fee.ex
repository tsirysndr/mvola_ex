defmodule MVola.Types.Fee do
  @type t() :: %__MODULE__{
          fee_amount: integer()
        }
  defstruct fee_amount: nil
end
