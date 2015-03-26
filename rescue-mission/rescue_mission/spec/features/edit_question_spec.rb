require 'rails_helper'
require 'factory_girl'

feature 'edit question', %Q{
  As a user
  I want to edit a question
  So that I can correct any mistakes or add updates
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:question) { FactoryGirl.create(:question) }
  before :each do
     sign_in user
   end

   def edit_question(title, description)
    visit edit_question_path(question)
    fill_in('Title', with: title)
    fill_in('Description', with: description)
    click_button('Repost Question')
   end

   scenario 'visitor can get to edit question page from questions details page ' do
     visit question_answers_path(question)
     click_link('Edit Question')
     expect(page).to have_button('Repost Question')
   end

   scenario 'visitor provides valid edited question' do
     title = question.title
     description = question.description

     edit_question(title, description)

     expect(page).to have_content('Question edited')
     expect(page).to have_content(question.title)
   end

   scenario 'visitor provides invalid information for editing' do
     title = "Too short"
     description = "Really way too short"

     edit_question(title, description)

     expect(page).to have_content("Invalid entry")
   end


end


def sign_in(user)
  visit new_user_session_path
  fill_in "Email", with: user.email
  fill_in "Password", with: user.password
  click_on "Log in"
end
