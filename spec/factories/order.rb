FactoryGirl.define do
    factory :order do |f|
      f.user  User.all.first
      f.partner "Test"
      f.cu_id 100
      f.order_type "donation"
      f.total_price 100
    end
end
