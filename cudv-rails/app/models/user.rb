class User < ActiveRecord::Base
  has_many :orders, dependent: :destroy, :counter_cache => true
  has_one :donations_org
end
