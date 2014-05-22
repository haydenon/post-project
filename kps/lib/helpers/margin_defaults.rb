class MarginDefaults
	def self.get_margin(priority)
		if(priority==1)
			return 1.15
		else
			return 1
		end
	end
end