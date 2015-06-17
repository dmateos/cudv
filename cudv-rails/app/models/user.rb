class User < ActiveRecord::Base
  has_many :orders, dependent: :destroy, :counter_cache => true
end
