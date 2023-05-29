defmodule ChangesetErrors do
  @moduledoc false

  alias Ecto.Changeset

  @doc """
  Formats changeset errors traversing over children's errors
  """
  def format(changeset) do
    # Pulled from ecto changeset docs https://hexdocs.pm/ecto/Ecto.Changeset.html#traverse_errors/2
    error_details =
      Changeset.traverse_errors(changeset, fn {msg, opts} ->
        Enum.reduce(opts, msg, fn {key, value}, acc ->
          String.replace(acc, "%{#{key}}", inspect(value))
        end)
      end)

    "the following errors occurred: #{get_errors(error_details)}"
  end

  defp get_errors(errors) when is_binary(errors), do: ~s("#{errors}")

  defp get_errors(errors) when is_list(errors) do
    error =
      errors
      |> Enum.map_join(", ", &get_errors(&1))

    "[ #{error} ]"
  end

  defp get_errors(errors) when is_map(errors) do
    error =
      errors
      |> Enum.map_join(", ", fn {field, errors} ->
        case errors do
          errors -> "#{field}: #{get_errors(errors)}"
        end
      end)

    "{ #{error} }"
  end
end
