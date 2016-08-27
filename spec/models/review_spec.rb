describe Review, type: :model do
  it 'is invalid if the review rating is more than 5' do
    review = Review.new(rating: 10)
    expect(review).to have(1).error_on(:rating)
  end

  it { should belong_to :user }
  it{ should belong_to :restaurant }
end
