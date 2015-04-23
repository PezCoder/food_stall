class CreateFoodsUsersJoin < ActiveRecord::Migration
  def change
    create_table :foods_users do |t|
    	t.references :user 
    	t.references :food
    end
    add_index("foods_users",["user_id","food_id"])
  end
end
