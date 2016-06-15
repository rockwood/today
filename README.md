# Today

Today is a command line tool for automating daily journals.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add today to your list of dependencies in `mix.exs`:

        def deps do
          [{:today, "~> 0.0.1"}]
        end

  2. Ensure today is started before your application:

        def application do
          [applications: [:today]]
        end

# Usage

    today "is a good day"

This creates or updates the file `~/today/YYYY-MM-DD.md` and appends the line "is a good day"
