class Meter < ActiveRecord::Base
	belongs_to :block
	has_many :requests
end
