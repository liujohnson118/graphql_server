defmodule GraphqlServerWeb.Schema.Queries.Shop do
  use Absinthe.Schema.Notation

  alias GraphqlServerWeb.Resolver

  object :shop_queries do
    field :shop, :shop do
      arg :id, non_null(:id)

      resolve fn %{id: id}, _ ->
        Resolver.Shop.find(%{id: id})
      end
    end

    field :shops, list_of(:shop) do
      arg :category, :shop_category

      resolve fn params, _ ->
        Resolver.Shop.all(params)
      end
    end
  end
end
