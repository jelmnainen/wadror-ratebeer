module AverageRating
    extend ActiveSupport::Concern
    

    def average_rating
    
        @avg = 0

	    ratings = self.ratings.to_a

	    if(ratings.count > 0 )

		    ratings.each do |rating|
			    @avg = @avg + rating.score
		    end

		    @avg = @avg / ratings.count

	    else
	    
	        return 0
	    
	    end
	    
        return @avg
	    
    end #average_rating
    
end #module
