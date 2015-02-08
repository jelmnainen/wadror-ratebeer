class Brewery < ActiveRecord::Base
	has_many :beers, dependent: :destroy
	has_many :ratings, through: :beers
	
	validates   :name,  length: {minimum: 3}
	validates   :year,  numericality: { greater_than_or_equal_to: 1042,
	                                    less_than_or_equal_to: ->(_){Time.now.year},
	                                    only_integer: true } 

    include AverageRating
    
end
