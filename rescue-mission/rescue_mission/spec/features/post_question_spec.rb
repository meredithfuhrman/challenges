require 'rails_helper'
require 'factory_girl'

feature 'post question', %Q{
  As a user
  I want to post a question
  So that I can receive help from others
} do

  scenario 'visitor clicks link to post new question' do
    visit questions_path
    click_link('Post a Question')

    expect(page).to have_button('Create Question')
  end

  scenario 'visitor provides valid question' do
    question_title = "This is a Test Title for a Test Question"
    question_description = "This is a test question that needs to be at least as long as one whole tweet. Tweet, tweet, tweet. Bullshit tweets for all. This is a test question that needs to be at least as long as one whole tweet. Tweet, tweet, tweet. Bullshit tweets for all."

    visit new_question_path
    fill_in('Title', with: question_title)
    fill_in('Description', with: question_description)

    click_button('Create Question')

    expect(page).to have_content('Question added.')
    expect(page).to have_content(question.title)
  end

  scenario 'visitor provides invalid information' do
    question_title = "Too short"
    question_description = "Really way too short"

    visit new_question_path
    fill_in('Title', with: question_title)
    fill_in('Description', with: question_description)
    click_button('Create Question')

    expect(page).to have_content("Invalid entry.")
  end

end
