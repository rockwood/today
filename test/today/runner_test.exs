defmodule Today.RunnerTest do
  use ExUnit.Case
  alias Today.{Format, Runner}
  @test_dir "tmp/test"

  describe "Runner.run/1: for the first time" do
    setup [:create_test_dir, :write_message]

    test "creates today's file" do
      file_contents = File.read!("#{@test_dir}/#{Format.filename}")
      assert file_contents =~ "Hello World"
    end
  end

  describe "Runner.run/1: multiple times" do
    setup [:create_test_dir, :write_message, :write_message]

    test "appends to today's file" do
      file_contents = File.read!("#{@test_dir}/#{Format.filename}")
      assert file_contents =~ "Hello World"
    end
  end

  defp create_test_dir(_) do
    File.mkdir_p(@test_dir)
    on_exit fn ->
      File.rm_rf(@test_dir)
    end
  end

  defp write_message(_) do
    Runner.run("Hello World", @test_dir)
  end
end
