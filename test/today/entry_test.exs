defmodule Today.EntryTest do
  use ExUnit.Case
  alias Today.Entry

  @test_entry %Entry{
    dir: "tmp/test",
    timestamp: DateTime.from_unix!(546186600)
  }

  describe "Entry.path/1" do
    test "formats the path" do
      assert Entry.path(@test_entry) == "tmp/test/1987-04-23.md"
    end
  end

  describe "Entry.time_heading/1" do
    test "formats the current time" do
      assert Entry.time_heading(@test_entry) == "## 14:30\n\n"
    end
  end

  describe "Entry.date_heading/1" do
    test "formats the current date" do
      assert Entry.date_heading(@test_entry) == "# 1987-04-23\n\n"
    end
  end
end
