defmodule Today.Runner do
  alias Today.Format

  def run(message, dir \\ System.user_home) do
    create_dir(dir)
    File.open "#{dir}/#{Format.filename}", [:utf8, :read, :append], fn(file) ->
      write_file(file, message)
    end
  end

  defp create_dir(dir) do
    File.mkdir_p(dir)
  end

  defp write_file(file, message) do
    write_heading(file)
    IO.write(file, message)
  end

  defp write_heading(file) do
    if IO.gets(file, :all) == :eof do
      IO.write(file, Format.date_heading)
    end

    IO.write(file, Format.time_heading)
  end
end
