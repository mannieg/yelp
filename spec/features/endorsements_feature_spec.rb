feature 'endorsing reviews' do

  context 'Reviews have been left' do
    before do
      kfc = Restaurant.create(name: 'KFC')
      kfc.reviews.create(rating: 3, thoughts: 'It was an abomination')
    end

    scenario 'a user can endorse a review, which updates the endorsement count', js: true do
      visit '/'
      click_link 'Endorse Review'
      expect(page).to have_content '1 endorsement'
    end

    scenario 'correct endorsement count is displayed for each review', js: true do
      mcdonalds = Restaurant.create(name: 'McDonalds')
      mcdonalds.reviews.create(rating: 4, thoughts: 'Drive through is great!')
      visit '/restaurants'
      within(:css, "div#McDonalds") do
        2.times { click_link "Endorse Review"; sleep 1 }
      end
      expect(page).to have_content '2 endorsement'
    end
  end

  scenario 'cannot leave an endorsement if no reviews', js: true do
    visit '/'
    expect(page).not_to have_link 'Endorse Review'
  end
end
