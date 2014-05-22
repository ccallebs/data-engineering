class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.string :purchaser_name
      t.integer :count
      t.belongs_to :item, index: true

      t.timestamps
    end
  end
end
