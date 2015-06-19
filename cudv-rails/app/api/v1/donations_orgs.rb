module V1
  class DonationsOrgs < Grape::API
    version "v1"
    format :json

    resource :donations_orgs do
      desc "Return all orgs"
      get do
        DonationsOrg.all 
      end

      desc "Return an org by cu_id"
      params do
        requires :cu_id, type: Integer 
      end

      route_param :cu_id do
        get do 
          DonationsOrg.find_by_cu_id(params[:cu_id])
        end
      end

      desc "Adds a new org"
      params do
        requires :cu_id, type: Integer
        requires :name, type: String
        requires :registered_at, type: String
        requires :user_id, type: Integer
        requires :budget, type: Float
        optional :status, type: String
      end

      post do
        if User.find_by_cu_id(params[:user_id]).nil?
          error!("User #{params[:user_id]} does not exist")
        end

        DonationsOrg.create!({
          cu_id: params[:cu_id],
          name: params[:name],
          registered_at: DateTime.parse(params[:registered_at]),
          user: User.find_by_cu_id(params[:user_id]),
          budget: params[:budget]
        })
      end
    end
  end
end
