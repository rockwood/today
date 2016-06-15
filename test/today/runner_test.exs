defmodule Today.RunnerTest do
  use ExUnit.Case
  alias Today.Runner
  @test_dir "tmp/test"

  setup do
    File.mkdir_p(@test_dir)
    on_exit fn ->
      File.rm_rf(@test_dir)
    end
  end

  test "creating a file" do
    Runner.run(%{dir: @test_dir, message: "Hello World"})
    assert File.read!("#{@test_dir}/something.txt") == "Hello World"
  end
end
