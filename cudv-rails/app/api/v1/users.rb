module V1
  class Users < Grape::API
    version "v1"
    format :json

    resource :users do
      desc "Return all users"
      get do
        User.all
      end

      desc "Returns a single user"
      params do
        requires :cu_id, type: Integer
      end

      route_param :cu_id do
        get do
          User.find_by_cu_id(params[:cu_id])
        end
      end

      desc "Adds a new user"
      params do
        requires :cu_id, type: Integer
        requires :name, type: String
        requires :email, type: String
        requires :location, type: String
        requires :registered_at, type: String
      end

      post do
        User.create!({
          cu_id: params[:cu_id],
          name: params[:name],
          email: params[:email],
          location: params[:location],
          registered_at: DateTime.parse(params[:registered_at])
        })
      end
    end
  end
end
