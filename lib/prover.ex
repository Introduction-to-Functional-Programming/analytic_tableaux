defmodule Prover do
  defstruct status: :unknown

  def prove(_sequent) do
    %__MODULE__{}
  end

  def get_status(%__MODULE__{status: status}) do
    status
  end
end
