class Rating < ActiveRecord::Base

	belongs_to :beer


	def to_s
	
		return "#{self.beer.name}: #{score}"
	end
	
	def destroy
	    rating = Rating.find(params[:id])
	    rating.delete
	    redirect_to ratings_path
    end

end
