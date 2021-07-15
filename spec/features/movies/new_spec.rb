require 'rails_helper'

RSpec.describe 'New Director Movie' do
  describe 'When I visit the Director Movies index' do
    it 'displays a link to create a new Director Movie' do
      director = Director.create!(name: 'Wes Anderson', oscar: false, nominations: 7)
      visit "/directors/#{director.id}/movies"

      click_link 'New Movie'

      expect(current_path).to eq("/directors/#{director.id}/movies/new")

      fill_in 'Title', with: 'The Grand Budapest Hotel'
      page.check 'Oscar'
      fill_in 'Nominations', with: 9
      click_on 'Create Movie'

      expect(current_path).to eq("/directors/#{director.id}/movies")
      expect(page).to have_content('The Grand Budapest Hotel')
    end
  end
end
