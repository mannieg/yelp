class EndorsementsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]
  
  def create
    @review = Review.find(params[:review_id])
    @review.endorsements.create
    render json: {new_endorsement_count: @review.endorsements.count}
 end
end
