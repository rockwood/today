defmodule Today.Format do
  def date_heading(now \\ DateTime.utc_now) do
    "# #{padded_date(now)}\n\n"
  end

  def time_heading(now \\ DateTime.utc_now) do
    "## #{now.hour}:#{now.minute}\n\n"
  end

  def filename(now \\ DateTime.utc_now) do
    "#{padded_date(now)}.md"
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
