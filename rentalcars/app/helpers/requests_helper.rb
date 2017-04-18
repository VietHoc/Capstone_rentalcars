module RequestsHelper
	def get_requestcar
        Request.where(verified: false)
    end

    def requesting
    	Request.where(["verified = ? and status = ?", 't', 1]).paginate(page: params[:page])
    end

    def retaling
    	Request.where(["verified = ? and status = ?", 't', 0]).paginate(page: params[:page])
    end

    def historied(id)
    	Request.where(["verified = ? and status = ? and user_id = ?", 't', -1, id]).paginate(page: params[:page])
    end

    def now(id)
        Request.where(["verified = ? and status = ? and user_id = ?", 't', 0, id]).paginate(page: params[:page])
    end
end
