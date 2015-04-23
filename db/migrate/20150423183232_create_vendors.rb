class CreateVendors < ActiveRecord::Migration
  def change
    create_table :vendors do |t|
    	t.string :email,:limit=>100,:null=>false
    	t.string :name,:limit=>50
    	t.string :tag_line
    	t.string :city,:limit=>50
    	t.string :phone_no,:limit=>10
    	t.text :password_digest

      t.timestamps null: false
    end

    add_index("vendors","email")
  end
end
