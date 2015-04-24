class User < ActiveRecord::Base
	has_secure_password
	#relationship
	has_and_belongs_to_many :foods


end
