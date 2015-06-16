FactoryGirl.define do
  factory :product do |f|
    f.name "test product"
    f.current_cost 0.0
    f.cu_id 1
    f.total_orders 12
  end 
end 
