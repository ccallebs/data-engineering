class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.decimal :price
      t.string :description
      t.belongs_to :merchant, index: true

      t.timestamps
    end
  end
end
