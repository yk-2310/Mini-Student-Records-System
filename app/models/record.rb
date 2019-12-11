class Record < ApplicationRecord
	validates :studentid, presence: true, length: {minimum: 5, maximum: 5} 

	
end
