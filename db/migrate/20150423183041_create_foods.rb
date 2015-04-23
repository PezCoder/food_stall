class CreateFoods < ActiveRecord::Migration
  def change
    create_table :foods do |t|
    	t.references :vendor

    	t.string "name",:limit=>50
    	t.string "category",:limit=>50
    	t.integer "price"
    	t.boolean "available"
    	t.datetime "order_date_time"

      t.timestamps null: false
    end
    add_index("foods","vendor_id")
  end
end
