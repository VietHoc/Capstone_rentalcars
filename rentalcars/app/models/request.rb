class Request < ApplicationRecord
	belongs_to :user
	belongs_to :car
	def verify_status_request
       update_columns(verified: true)
       update_columns(status: 1)
    end
    def handing_request		
    	update_columns(status: 0)
    end
    def cancel_request
    	update_columns(status: -1)
    end
end