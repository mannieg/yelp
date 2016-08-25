require 'byebug'

feature 'endorsing reviews' do

  context 'Reviews have been left' do
    before do
      kfc = Restaurant.create(name: 'KFC')
      kfc.reviews.create(rating: 3, thoughts: 'It was an abomination')
    end

    scenario 'a user can endorse a review, which updates the endorsement count' do
      visit '/'
      click_link 'Endorse Review'
      expect(page).to have_content '1 endorsement'
    end

    # scenario 'correct endorsement count is displayed for each review' do
    #   mcdonalds = Restaurant.create(name: 'McDonalds')
    #   mcdonalds.reviews.create(rating: 4, thoughts: 'Drive through is great!')
    #   visit '/'
    #   within("//div[@id='McDonalds']") do
    #     click_link "endorse-btn-3"
    #     click_link "endorse-btn-3"
    #     expect(page).to have_content '1 endorsement'
    #   end
    #   within("//div[@id='KFC']") do
    #     click_link "endorse-btn-2"
    #     click_link "endorse-btn-2"
    #     sleep(2)
    #     expect(page).to have_content '2 endorsement'
    #   end
    # end
  end

  scenario 'cannot leave an endorsement if no reviews' do
    visit '/'
    expect(page).not_to have_link 'Endorse Review'
  end
end
