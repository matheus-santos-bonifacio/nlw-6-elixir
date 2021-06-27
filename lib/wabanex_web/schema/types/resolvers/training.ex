defmodule WabanexWeb.Resolvers.Training do
  def create(%{input: params}, _context), do: Wabanex.Trainigns.Create.call(params)
end
