defmodule GraphqlServerWeb.Shop do
  @all_shops [
    %{id: 1, name: "Clothing Shop 1", category: :CLOTHING, address: %{country: "US", city: "Orlando"}},
    %{id: 2, name: "Custom Clothing Shop 1", category: :CLOTHING, address: %{country: "US", city: "Seattle"}},
    %{id: 3, name: "Hardware Shop", category: :HARDWARE, address: %{country: "Canada", city: "Vancouver"}},
    %{id: 4, name: "Pool Shop", category: :HARDWARE, address: %{country: "US", city: "Calgary"}}
  ]

  def all(%{category: category}) do
    case Enum.filter(@all_shops, &(&1.category === category)) do
      [] -> {:error, %{message: "not found", details: %{category: category}}}
      shops -> {:ok, shops}
    end
  end

  def all(_) do
    {:ok, @all_shops}
  end

  def find(%{id: id}) do
    id = String.to_integer(id)
    case Enum.find(@all_shops, &(&1.id === id)) do
      nil -> {:error, %{message: "not found", details: %{id: id}}}
      shop -> {:ok, shop}
    end
  end

  def update(id, params) do
    with {:ok, shop} <- find(%{id: id}) do
      {:ok, Map.merge(shop, params)}
    end
  end
end
