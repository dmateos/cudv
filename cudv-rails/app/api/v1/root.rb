module V1
  class Root < Grape::API
    mount V1::Users
    mount V1::Orders
    mount V1::Products
  end
end
