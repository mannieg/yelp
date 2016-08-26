module RestaurantsHelper
  def average_rating
    return 'N/A' if reviews.none?
    reviews.average(:rating)
  end
end
