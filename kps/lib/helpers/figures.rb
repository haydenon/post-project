class Figures
	def self.get_revenue_expenditure (time)
		revenue = 0
    	expenditure = 0
    	mailrrs = MailRequestRouteSegment.where("created_at <= ?",
  		time)
    	mailrrs.each do |mrrs|
      		revenue = revenue + mrrs.price
      		expenditure = expenditure + mrrs.cost
      	end
      	return [revenue, expenditure]
	end
end