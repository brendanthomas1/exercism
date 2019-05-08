defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    String.downcase(sentence)
    |> String.replace(~r/(:|,|\.|!|&|@|\$|%|\^)/, "")
    |> String.split(~r/( |_)/, trim: true)
    |> Enum.reduce(%{}, fn word, map->
      unless get_in(map, [word]) |> is_nil() do
        map = Map.put(map, word, map[word] + 1)
      else
        map = Map.put(map, word, 1)
      end
    end)
  end
end
