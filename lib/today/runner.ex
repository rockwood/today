defmodule Today.Runner do
  def run(%{message: message, dir: dir}) do
    File.mkdir_p(dir)
    File.open "#{dir}/something.txt", [:utf8, :append], fn(file) ->
      IO.write(file, message)
    end
  end
end
