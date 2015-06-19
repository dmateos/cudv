FactoryGirl.define do
  factory :donations_org do |f|
    f.user { User.all.first }
    f.name "Test orgt"
    f.cu_id 1
    f.registered_at DateTime.now
    f.budget 0.00
    f.status "Not Started"
  end
end
