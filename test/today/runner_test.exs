defmodule Today.RunnerTest do
  use ExUnit.Case
  alias Today.{Entry, Runner}

  @test_entry %Entry{
    timestamp: DateTime.from_unix!(546186600),
    dir: "tmp/test",
    body: "Hello World"
  }

  describe "Runner.run/1: for the first time" do
    setup [:create_test_dir, :write_message]

    test "creates today's file" do
      file_contents = File.read!(Entry.path(@test_entry))
      assert file_contents =~ "Hello World"
    end
  end

  describe "Runner.run/1: multiple times" do
    setup [:create_test_dir, :write_message, :write_message]

    test "appends to today's file" do
      file_contents = File.read!(Entry.path(@test_entry))
      assert file_contents =~ "Hello World"
    end
  end

  defp create_test_dir(_) do
    File.mkdir_p(@test_entry.dir)
    on_exit fn ->
      File.rm_rf(@test_entry.dir)
    end
  end

  defp write_message(_) do
    Runner.run(@test_entry)
  end
end
