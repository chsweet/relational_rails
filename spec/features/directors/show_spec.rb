require 'rails_helper'

RSpec.describe "directors show page", type: :feature do
  # As a visitor
  # When I visit '/parents/:id'
  # Then I see the parent with that id including the parent's attributes:
  # - data from each column that is on the parent table
  describe 'they visit /directors/:id' do
    it 'displays director id and attributes' do
      director_1 = Director.create!(name: "Quentin Tarantino", oscar: true, nominations: 17)
      # binding.pry
      visit "/directors/#{director_1.id}"
      save_and_open_page

      expect(page).to have_content(director_1.name)
      expect(page).to have_content("Has Oscar: #{director_1.oscar}")
      expect(page).to have_content("Total Nominations: #{director_1.nominations}")
    end
  end
end
