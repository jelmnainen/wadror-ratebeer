class Beer < ActiveRecord::Base

	include AverageRating
	
	belongs_to :brewery
	has_many :ratings, dependent: :destroy
	has_many :raters, through: :ratings, source: :user
    
    validates :name,    uniqueness: true,
                        length: {minimum: 3}
    
	def to_s
		return "#{self.brewery.name}: #{name}"
	end

end
