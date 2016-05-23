defmodule MadLib do

end

ExUnit.start()

defmodule MadLibTest do

  use ExUnit.Case, async: true

  import ExUnit.CaptureIO

  test "requests a noun" do
    assert capture_io(fn ->
      MadLib.request_noun
    end) == "Enter a noun:"
  end
end
