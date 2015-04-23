class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string :email,:limit=>100,:null=>false
    	t.string :name,:limit=>50
    	t.string :city,:limit=>50
    	t.string :address
    	t.string :phone_no,:limit=>10
    	t.text :password_digest
      t.timestamps null: false
    end
    add_index("users","email")
  end
end
