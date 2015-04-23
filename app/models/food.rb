class Food < ActiveRecord::Base
	#relationships
	has_and_belongs_to_many :users
	belongs_to :vendor

	scope :search_for,lambda { |query| where(["name LIKE ?","%#{query}%"])}
	scope :recent,lambda { order("created_at DESC") }
end
