defmodule PrintQuotes do

  def ask_for_quote do
    IO.puts "What is the quote?"
  end

  def ask_for_author do
    IO.puts "Who is the author?"
  end

  def output_quote_and_author(author, verb \\ " says, ", phrase) do
    Enum.join([author, verb, "\"", phrase, "\""])
  end
end

ExUnit.start

defmodule PrintQuotesTest do

  use ExUnit.Case, async: true

  import ExUnit.CaptureIO

  test "requests a quote" do
    assert capture_io(fn ->
      PrintQuotes.ask_for_quote
    end) == "What is the quote?\n"
  end

  test "requests an author" do
    assert capture_io(fn ->
      PrintQuotes.ask_for_author
    end) == "Who is the author?\n"
  end

  test "builds output correctly" do
    author = "Obi-Wan"
    phrase = "These are not the droids you are looking for."
    assert PrintQuotes.output_quote_and_author(author, phrase) == "Obi-Wan says, \"These are not the droids you are looking for.\""
  end
end
