require "rails_helper"

describe "Order API" do
  describe "GET /api/v1/orders/" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:order) { FactoryGirl.create(:order) }

    it "returns all the orders" do
      get "/api/v1/orders/"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).first["id"]).to eq(order.id)
    end
  end

  describe "POST /api/v1/orders/" do
    let!(:user) { FactoryGirl.create(:user) }
    let(:new_order) { { user_id: user.id, partner: "test", cu_id: 1, order_type:"test", total_price: 10.0 } }

    it "adds a new order" do
      post "/api/v1/orders/", new_order
      expect(response.status).to eq(201)
    end
  end
end
