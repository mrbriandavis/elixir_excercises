defmodule Anagram do
  def signature( word ) do
    word
    |> _codepoints
    |> _sort
    |> _join
  end

  def _codepoints(word) do
    String.codepoints(word)
  end

  def _sort(word) do
    Enum.sort(word)
  end

  def _join(word) do
    Enum.join(word)
  end
end

ExUnit.start

defmodule AnagramTest do

  use ExUnit.Case, async: true

  test "codepoints a word" do
    assert Anagram._codepoints("word") == ["w", "o", "r", "d"]
  end

  test "sorts a list of letters" do
    assert Anagram._sort(["c", "b", "a"]) == ["a", "b", "c"]
  end

  test "joins a list of characters" do
    assert Anagram._join(["a","c","t"]) == "act"
  end

  test "creates signature of a word" do
    assert Anagram.signature("cat") == "act"
  end

end
