class Item < ActiveRecord::Base
  belongs_to :merchant

  validates :merchant, presence: true
  validates :price, presence: true, numericality: true
end
