defmodule Today.FormatTest do
  use ExUnit.Case
  alias Today.Format

  @now DateTime.from_unix!(546186600)

  describe "Format.time_heading/1" do
    test "formats the current time" do
      assert Format.time_heading(@now) == "## 14:30\n\n"
    end
  end

  describe "Format.date_heading/1" do
    test "formats the current date" do
      assert Format.date_heading(@now) == "# 1987-04-23\n\n"
    end
  end

  describe "Format.filename/1" do
    test "formats the filename" do
      assert Format.filename(@now) == "1987-04-23.md"
    end
  end
end
