module Acquisition
  class Normalizer
    attr_accessor :purchase

    def initialize(row)
      @row = row
    end

    def normalize!
      @purchase = populate_purchase(@row)
    end

    delegate :revenue, to: :purchase

    private

    def populate_purchase(row)
      Purchase.create do |p|
        p.purchaser_name = row[:purchaser_name]
        p.count = row[:purchase_count]
        p.item = populate_item(row)
      end
    end

    def populate_item(row)
      Item.where(
        description: row[:item_description],
        price: row[:item_price],
        merchant: populate_merchant(row)
      ).first_or_create
    end

    def populate_merchant(row)
      Merchant.where(
        name: row[:merchant_name],
        address: row[:merchant_address]
      ).first_or_create
    end
  end
end