defmodule Distancia.Hamming do
  alias Distancia.Utils.Parser
  alias Distancia.Utils.Validator

  def calculate(p, q) do
    Validator.validate!(p, q)
    |> Parser.map_to_lists()
    |> Enum.zip()
    |> Enum.reduce(0, fn({a, b}, acc) ->
      case a === b do
        true  -> acc
        false -> acc + 1
      end
    end)
  end
end