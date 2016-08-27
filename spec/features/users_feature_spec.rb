feature 'Users can sign in and out' do
  context "user not signed in and on the homepage" do
    it "should see a 'sign in' and 'sign up' link" do
      visit '/'
      expect(page).to have_link 'Sign in'
      expect(page).to have_link 'Sign up'
    end

    it "should not show sign out while logged in" do
      visit '/'
      expect(page).not_to have_link 'Sign out'
    end
  end

  context "when user is signed in" do
    before do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: 'test@example.com'
      fill_in 'Password', with: 'Password123'
      fill_in 'Password confirmation', with: 'Password123'
      click_button 'Sign up'
    end

    it "should see a sign out link" do
      visit '/'
      expect(page).to have_link 'Sign out'
    end

    it "should not have sign in and/or sign up links" do
      visit '/'
      expect(page).not_to have_link 'Sign in'
      expect(page).not_to have_link 'Sign up'
    end
  end
end
