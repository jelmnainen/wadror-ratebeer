class Rating < ActiveRecord::Base

	belongs_to :beer, dependent: :destroy
	belongs_to :user, dependent: :destroy
    	
	validates :score, numericality: {   greater_than_or_equal_to: 1,
	                                    less_than_or_equal_to: 50,
                                        only_integer: true}

	def to_s	
		return "#{self.beer.name}: #{score}"
	end
	
	def destroy
	    rating = Rating.find(params[:id])
	    rating.delete
	    redirect_to :back
    end
    
    def create
        @rating = Rating.new params.require(:rating).permit(:score, :beer_id)
        
        if @rating.save
            current_user.ratings << @rating
            redirect_to current_user
        else
            @beers = Beer.all
            render :new
        end
    end

end
