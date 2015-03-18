require "spec_helper"

feature "user adds a new TV show" do
  # As a TV fanatic
  # I want to add one of my favorite shows
  # So that I can encourage others to binge watch it
  #
  # Acceptance Criteria:
  # * I must provide the title, network, and starting year.
  # * I can optionally provide the final year, genre, and synopsis.
  # * The synopsis can be no longer than 5000 characters.
  # * The starting year and ending year (if provided) must be
  #   greater than 1900.
  # * The genre must be one of the following: Action, Mystery,
  #   Drama, Comedy, Fantasy
  # * If any of the above validations fail, the form should be
  #   re-displayed with the failing validation message.


  scenario "successfully add a new show " do
    visit "/"
    click_link('Add New Show')
    fill_in 'title', with: 'Northern Exposure'
    fill_in 'network', with: 'CBS'
    fill_in 'starting_year', with: '1990'
    fill_in 'ending_year', with: '1995'
    fill_in 'synopsis', with: 'A show about a doctor in Alaska'
    click_button('Add TV Show')

    expect(page).to have_content('Northern Exposure (CBS)')
  end

  scenario "fail to add a show with invalid information" do
    visit "/"
    click_link('Add New Show')
    fill_in 'title', with: 'Northern Exposure'
    fill_in 'network', with: 'CBS'
    fill_in 'starting_year', with: '1800'
    fill_in 'ending_year', with: '1800'
    click_button('Add TV Show')

    expect(page).to have_content('Add Show')
  end

end
