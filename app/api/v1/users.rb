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
        requires :id, type: Integer
      end

      get :user do
        User.find(params[:id])
      end

      desc "Adds a new user"
      params do
        requires :cu_id, type: Integer
        requires :name, type: String
        requires :email, type: String
        requires :location, type: String
      end

      post do
        User.create!({
          cu_id: params[:cu_id],
          name: params[:name],
          email: params[:email],
          location: params[:location]
        })
      end
    end
  end
end
