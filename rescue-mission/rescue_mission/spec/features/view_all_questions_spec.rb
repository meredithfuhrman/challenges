require 'rails_helper'
require 'factory_girl'

feature 'view all questions', %Q{
  As a user
  I want to view recently posted questions
  So that I can help others
} do

  let!(:question) { FactoryGirl.create(:question) }

  scenario 'visitor views list of all questions' do
      visit questions_path
      expect(page).to have_content(question.title)
      expect(page).to_not have_content(question.description)
    end

    scenario 'visitor sees questions sorted by last created questions' do
      visit questions_path
      expect(page).to have_content(question.created_at)
    end

end
