require "rails_helper"

describe "Products API" do
  describe "GET /api/v1/products/" do
    let(:product) { FactoryGirl.create(:product) }

    it "returns all the products" do
      get "/api/v1/products/"
      #expect(response.status).to eq(200)
      #expect(JSON.parse(response.body).first["id"]).to eq(product.id)
    end    
  end

  describe "POST /api/v1/products/" do
    let(:new_product) { { name: "test product", current_cost: 0.00 } } 

    it "adds a new product" do
      #post "/api/v1/products/", new_product
      #expect(response.status).to eq(201)
    end
  end
end
