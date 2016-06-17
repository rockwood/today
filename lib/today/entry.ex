defmodule Today.Entry do
  defstruct timestamp: DateTime.utc_now, dir: "#{System.user_home}/today", body: ""

  def path(entry) do
    "#{entry.dir}/#{padded_date(entry.timestamp)}.md"
  end

  def date_heading(entry) do
    """
    #{padded_date(entry.timestamp)}
    ==================================

    """
  end

  def time_heading(entry) do
    """
    #{entry.timestamp.hour}:#{entry.timestamp.minute}
    ---------------

    """
  end

  def formated_body(entry) do
    """
    #{entry.body}

    """
  end

  defp padded_date(date) do
    "#{date.year}-#{left_pad(date.month)}-#{left_pad(date.day)}"
  end

  defp left_pad(integer) do
    integer
    |> Integer.to_string
    |> String.rjust(2, ?0)
  end
end
