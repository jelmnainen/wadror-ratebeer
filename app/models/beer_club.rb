class BeerClub < ActiveRecord::Base
  has_many :members, through: :memberships, source: :user
  has_many :memberships

  def to_s
    return "#{self.name} (est. #{self.city}, #{self.year})"
  end
end
