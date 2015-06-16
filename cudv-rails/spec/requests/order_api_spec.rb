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

  describe "GET /api/v1/orders/:id" do 
    let!(:user) { FactoryGirl.create(:user) }
    let!(:order) { FactoryGirl.create(:order) }

    it "returns a single order" do
      get "/api/v1/orders/#{order.cu_id}"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)["id"]).to eq(order.id)
    end
  end

  describe "POST /api/v1/orders/" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:product) { FactoryGirl.create(:product) }
    let(:new_order) { 
      { user_id: user.cu_id, partner: "test", cu_id: 1, order_type:"test", total_price: 10.0, products: [ product.cu_id ]  } 
    }

    it "adds a new order" do
      post "/api/v1/orders/", new_order
      expect(response.status).to eq(201)
    end

    it "increments the products order_count on a new order" do
      total_orders = product.total_orders
      post "/api/v1/orders/", new_order
      product.reload
      expect(product.total_orders).to eq(total_orders +1)
    end
  end
end
