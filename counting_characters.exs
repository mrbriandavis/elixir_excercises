defmodule CountingCharacters do

  # docstring are quite useful you can generate docs out of them
  # check: http://elixir-lang.org/getting-started/module-attributes.html
  # for more info

  @doc """
  Counts characters of String
  """
  def count_characters(string) do
    String.length string
  end

  @doc """
  Builds output string
  """
  def output_phrase(length, string) do
    IO.write "#{string} has #{length} characters"
  end

  @doc """
  Gets word from standard IO
  """
  def get_word do
    IO.gets("What is the input string?")
    |> String.strip
  end

  @doc """
  Builds output string
  """
  def count_word_and_output do
    my_word = get_word
    my_word
    |> count_characters
    |> output_phrase(my_word)
  end


end

ExUnit.start

defmodule CountingCharactersTest do

  use ExUnit.Case, async: true

  import ExUnit.CaptureIO

  test "counts length of input" do
    assert CountingCharacters.count_characters("1") == 1
  end

  test "outputs phrase" do
    assert capture_io(fn ->
      CountingCharacters.output_phrase(1, "foo")
    end) == "foo has 1 characters"
  end

  test "outputs name with no newline" do
    capture_io([input: "word\n", capture_prompt: false], fn ->
      name = CountingCharacters.get_word
      assert name == "word"
    end)
  end

  test "end to end test" do
    assert capture_io([input: "foo\n", capture_prompt: false], fn ->
      CountingCharacters.count_word_and_output
    end) == "foo has 3 characters"
  end

end
