module V1
  class Products < Grape::API
    version "v1"
    format :json

    resource :products do
      desc "Return all products"
      get do
        Product.all
      end

      desc "Return a single product"
      params do
        requires :cu_id, type: Integer
      end 

      route_param :cu_id do
        get do
          Product.find(params[:cu_id])
        end
      end

      desc "Add a new product"
      params do
        requires :name, type: String
        requires :current_cost, type: Float
        requires :cu_id, type: Integer
      end

      post do
        Product.create!({
          name: params[:name],
          current_cost: params[:current_cost],
          cu_id: params[:cu_id]
        })
      end
    end
  end
end
