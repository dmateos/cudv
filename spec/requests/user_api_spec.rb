require "rails_helper"

describe "Users API" do
  describe "GET /api/v1/users/" do
    let!(:user) { FactoryGirl.create(:user) }

    it "returns all the users" do
      get "/api/v1/users/"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).first["name"]).to eq(user.name)
    end
  end

  describe "GET /api/v1/users/user" do
    let!(:user) { FactoryGirl.create(:user) }

    it "returns a single user" do
      get "/api/v1/users/user?id=#{user.id}"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)["id"]).to eq(user.id)
    end
  end

  describe "POST /api/v1/users/" do
    let(:new_user) { { cu_id: 1, name: "test", email: "test@test.com", location: "Test/Test" } }

    it "adds a new user" do
      post "/api/v1/users/", new_user
      expect(response.status).to eq(201)
    end
  end
end
