class Food < ActiveRecord::Base
	#relationships
	has_and_belongs_to_many :users
	belongs_to :vendor

end
