def sign_up(email = "test@example.com")
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: email
  fill_in 'Password', with: 'Password123'
  fill_in 'Password confirmation', with: 'Password123'
  click_button 'Sign up'
end

def leave_review(thoughts, rating)
  visit '/'
  click_link 'Review KFC'
  fill_in 'Thoughts', with: thoughts
  select rating, from: 'Rating'
  click_button 'Leave Review'
end
