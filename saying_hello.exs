defmodule HelloWorld do

  # docstring are quite useful you can generate docs out of them
  # check: http://elixir-lang.org/getting-started/module-attributes.html
  # for more info
  @doc """
  Prints a string to standard IO
  """
  def request_name do
    IO.puts "What is your name"
  end

  @doc """
  Gets name from standard IO
  """
  def get_name do
    IO.gets(request_name)
    |> String.strip
    |> String.capitalize
  end
end

ExUnit.start

defmodule HelloWorldTest do

  use ExUnit.Case, async: true

  import ExUnit.CaptureIO

  test "requests to input name" do
    assert capture_io(fn ->
      HelloWorld.request_name
    end) == "What is your name\n"
  end

  test "capitalizes input on name" do
    capture_io([input: "sam\n", capture_prompt: false], fn ->
      name = HelloWorld.get_name
      assert name == "Sam"
    end)
  end
end
