module RequestsHelper
	 def get_requestcar
        Request.where(verified: false)
    end
end
