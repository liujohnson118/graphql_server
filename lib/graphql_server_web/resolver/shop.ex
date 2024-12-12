defmodule GraphqlServerWeb.Resolver.Shop do
  def all(params) do
    GraphqlServerWeb.Shop.all(params)
  end

  def find(%{id: id}) do
    GraphqlServerWeb.Shop.find(%{id: id})
  end

  def update(%{id: id} = params, _) do
    GraphqlServerWeb.Shop.update(id, Map.delete(params, :id))
  end
end
