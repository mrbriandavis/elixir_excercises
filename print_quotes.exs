defmodule PrintQuotes do

  def ask_for_quote do
    IO.puts "What is the quote?"
  end

  def ask_for_author do

  end

  def output_quote_and_author do

  end
end

ExUnit.start

defmodule PrintQuotesTest do

  use ExUnit.Case, async: true

  import ExUnit.CaptureIO

  test "requests to import a quote" do
    assert capture_io(fn ->
      PrintQuotes.ask_for_quote
    end) == "What is the quote?\n"
  end
end