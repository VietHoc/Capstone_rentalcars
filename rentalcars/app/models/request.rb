class Request < ApplicationRecord
	belongs_to :user
	belongs_to :car
	def verify_request
       update_columns(verified: true)
    end
end