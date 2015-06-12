module V1
  class Orders < Grape::API 
    version "v1"
    format :json

    resource :orders do
      desc "Return all orders" 
      get do
        Order.all
      end

      desc "Add a new order"
      params do
        requires :user_id, type: Integer
        requires :partner, type: String
        requires :cu_id, type: Integer
        requires :order_type, type: String
        requires :total_price, type: Float
      end

      post do
        Order.create!({
          user_id: params[:user_id],
          partner: params[:partner],
          cu_id: params[:cu_id],
          order_type: params[:order_type],
          total_price: params[:total_price]
        })
      end
    end
  end
end
