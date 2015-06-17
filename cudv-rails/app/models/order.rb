class Order < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :products

  before_save :default_ordered_at

  def default_ordered_at
    self.ordered_at ||= DateTime.now if new_record?
  end
end
