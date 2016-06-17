defmodule Today.Runner do
  alias Today.Entry

  def run(entry) do
    create_dir(entry.dir)
    File.open Entry.path(entry), [:utf8, :read, :append], fn(file) ->
      write_file(file, entry)
    end
  end

  defp create_dir(dir) do
    File.mkdir_p(dir)
  end

  defp write_file(file, entry) do
    if IO.gets(file, :all) == :eof do
      IO.write(file, Entry.date_heading(entry))
    end

    IO.write(file, Entry.time_heading(entry))
    IO.write(file, Entry.formated_body(entry))
  end
end
