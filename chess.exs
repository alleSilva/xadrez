defmodule Chess do
  @pieces %{
    "1" => "Peão",
    "2" => "Bispo",
    "3" => "Cavalo",
    "4" => "Torre",
    "5" => "Rainha",
    "6" => "Rei"
  }

  def count_from_file() do
    input = 
    "./boards.txt"
    |> File.read!()
    |> String.split("\n\n")
    |> Enum.map(& String.trim/1)
    output = Enum.map(input, & count_pieces/1) |> Enum.flat_map(& &1)
    input_splitted = Enum.map(input, & String.split(&1, "\n"))
    IO.inspect(input_splitted)
    IO.inspect(output)
    #show_result(input, output)
  end

  def count_pieces(list) do
    new_list = String.split(list) 
    ["1", "2", "3", "4", "5", "6"]
    |> Enum.map(& Enum.count(new_list, fn x -> x == &1 end) |> output_line(&1))
    |> Enum.chunk_every(6)
  end

  defp output_line(count, item) do
    "#{@pieces[item]}: #{count} peça(s)"
  end
  
  def show_result(input, output), do: show(input, output, 0)

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

Chess.count_from_file()
