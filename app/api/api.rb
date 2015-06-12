class API < Grape::API
  prefix "api"
  mount API::V1::Root
end
