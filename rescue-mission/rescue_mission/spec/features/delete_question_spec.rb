require 'rails_helper'
require 'factory_girl'

feature 'delete question', %Q{
  As a user
  I want to delete a question
  So that I can delete duplicate questions
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:question) { FactoryGirl.create(:question) }
  before :each do
     sign_in user
   end

  scenario 'visitor can get delete question from question details page' do
    visit question_answers_path(question)
    click_button('Delete Question')
    expect(page).to have_content('Question deleted')
  end

  scenario 'visitor can get delete question from edit question page' do
    visit edit_question_path(question)
    click_button('Delete Question')
    expect(page).to have_content('Question deleted')
  end

  #test for deleting answers?

end
