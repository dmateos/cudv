FactoryGirl.define do
  factory :user do |f|
    f.cu_id 100
    f.name "test"
    f.email "test@test.com"
    f.location "Adelaide/South Australia"
    f.registered_at DateTime.now
  end
end
