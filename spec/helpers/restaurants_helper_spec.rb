require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RestaurantsHelper. For example:
#
# describe RestaurantsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

#____________________________________________________________
# RSpec.describe RestaurantsHelper, type: :helper do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

def sign_in
  visit '/'
  click_link 'Sign in'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'Password123'
  click_button 'Log in'
end

def sign_up
  visit '/'
  click_link 'Sign up'
  fill_in 'Email', with: 'test@example.com'
  fill_in 'Password', with: 'Password123'
  fill_in 'Password confirmation', with: 'Password123'
  click_button 'Sign up'
end