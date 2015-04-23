class Vendor < ActiveRecord::Base
	has_many :foods,:dependent=>:destroy
end
