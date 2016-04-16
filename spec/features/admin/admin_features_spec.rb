# Feature: Admin page
#   As an admin
#   I want to visit an admin page
#   So I can add, edit and delete products

feature 'Admin page' do

  # Scenario: Visit the admin page
  #   Given I am a visitor
  #   When I visit the home page
  #
  #   Then I see "Quizzes/New"
  scenario 'visit the admin page', js: true do
    visit admin_path
    expect(page).to have_content 'Add Question'
    click_link 'Add Question'
    
    puts "Capybara.javascript_driver is #{Capybara.javascript_driver}"
  end

end
