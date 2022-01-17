class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.string :item_name
      t.string :location_type
      t.integer :quantity
      t.datetime :date_added

      t.timestamps
    end
  end
end
