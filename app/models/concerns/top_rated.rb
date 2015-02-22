module TopRated
  extend ActiveSupport::Concern

  def self.top(n)
    sorted_by_rating_in_desc_order = self.all.sort_by{ |b| -(b.average_rating||0) }
    return sorted_by_rating_in_desc_order.take(n)
  end
