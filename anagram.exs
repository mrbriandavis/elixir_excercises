defmodule Anagram do
  def signature( word ) do
    word
    |> codepoints
    |> sort
    |> join
  end

  def codepoints(word) do
    String.codepoints(word)
  end

  def sort(word) do
    Enum.sort(word)
  end

  def join(word) do
    Enum.join(word)
  end
end

ExUnit.start

defmodule AnagramTest do

  use ExUnit.Case, async: true

  test "codepoints a word" do
    assert Anagram.codepoints("word") == ["w", "o", "r", "d"]
  end

  test "sorts a list of letters" do
    assert Anagram.sort(["c", "b", "a"]) == ["a", "b", "c"]
  end

  test "joins a list of characters" do
    assert Anagram.join(["a","c","t"]) == "act"
  end

  test "creates signature of a word" do
    assert Anagram.signature("cat") == "act"
  end

end
