class Car < ApplicationRecord
	def self.search(search)
     if search
        where(["brand LIKE ?", "%#{search}%"])
     else
       all
     end
   end
end
