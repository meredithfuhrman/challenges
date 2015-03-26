require 'rails_helper'
require 'factory_girl'

feature 'view answers', %Q{
  As a user
  I want to view the answers for a question
  So that I can learn from the answer
} do

  let!(:user) { FactoryGirl.create(:user) }
  let!(:question) { FactoryGirl.create(:question) }
  let!(:answer) { FactoryGirl.create(:answer, question: question) }
  before :each do
     sign_in user
   end

  scenario 'visitor views all answers on question details page' do
    visit question_answers_path(question)
    expect(page).to have_content(answer.description)
    end
end
