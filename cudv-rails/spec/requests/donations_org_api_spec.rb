require "rails_helper"

describe "DonationsOrgs API" do
  describe "GET /api/v1/donations_orgs/" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:don_org) { FactoryGirl.create(:donations_org) }

    it "returns all the orgs" do
      get "/api/v1/donations_orgs"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body).first["id"]).to eq(don_org.id)
    end
  end

  describe "GET /api/v1/donations_orgs/:id" do
    let!(:user) { FactoryGirl.create(:user) }
    let!(:don_org) { FactoryGirl.create(:donations_org) }

    it "returns a single org" do
      get "/api/v1/donations_orgs/#{don_org.cu_id}"
      expect(response.status).to eq(200)
      expect(JSON.parse(response.body)["id"]).to eq(don_org.id)
    end
  end

  describe "POST /api/v1/donations_orgs/:id" do
    let!(:user) { FactoryGirl.create(:user) }
    let(:new_org) { { user_id: user.cu_id, name: "test org", cu_id: 1, registered_at: DateTime.now, status: "Not Started", budget: 0.00 } }

    it "adds a new org" do
      post "/api/v1/donations_orgs/", new_org
      expect(response.status).to eq(201)
      expect(DonationsOrg.find_by_cu_id(1)).to_not be_nil
    end
  end
end
