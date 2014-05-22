class Purchase < ActiveRecord::Base
  belongs_to :item

  delegate :price, to: :item

  validates :item, presence: true
  validates :count, presence: true

  def revenue
    count * price
  end
end
