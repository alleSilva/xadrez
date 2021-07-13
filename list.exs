defmodule ListShow do
  def call(input, output), do: show(input, output, 0)

  defp show([], _l2, _acc), do: {:ok}
  
  defp show([h1 | t1], [], acc) do
    acc = acc + 1
    IO.puts(h1 <> "\n")
    show(t1, [], acc)
  end

  defp show([h1 | t1], [h2 | t2], acc) do
    acc = acc + 1
    IO.puts(h1 <> "\t" <> h2 <> "\n")
    show(t1, t2, acc)
  end
end

ListShow.call(["1", "2", "3", "4", "5","6"], ["a", "b", "c", "d"])
