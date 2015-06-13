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
        requires :products, type: Array
      end

      post do
        if User.find_by_id(params[:user_id]).nil?
          error!("User #{params[:user_id]} does not exist")
        end

        begin
          Product.find(params[:products])
        rescue
            error!("Product does not exsist")
        end

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
