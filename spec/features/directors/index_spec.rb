require 'rails_helper'

RSpec.describe "directors index page", type: :feature do
  before :each do
    @director_1 = Director.create!(name: "Quentin Tarantino", oscar: true, nominations: 8, created_at: "23-01-1993")
    @director_2 = Director.create!(name: "Alfred Hitchcock", oscar: false, nominations: 5, created_at: "14-09-2009" )
    @director_3 = Director.create!(name: "Woody Allen", oscar: true, nominations: 24, created_at: "16-04-2008")
  end
  describe 'they visit /directors' do
    it 'displays all director names' do
      visit '/directors'

      expect(page).to have_content(@director_1.name)
      expect(page).to have_content(@director_2.name)
      expect(page).to have_content(@director_3.name)
    end

    it 'displays directors by most recently created with created_at displayed' do
      visit '/directors'

      expect(@director_1.name).to appear_before(@director_2.name, only_text: true)
      expect(@director_2.name).to_not appear_before(@director_3.name, only_text: true)
    end

    it 'displays a link to the movies index page' do
      visit '/directors'
      click_on('Movies')

      expect(current_path).to eq('/movies')
    end

    it 'displays a link to the directors index page' do
      visit '/directors'
      click_on('Directors')

      expect(current_path).to eq('/directors')
    end

    #User Story 17
    it 'each director has their own edit link' do
      visit '/directors'

      expect(page).to have_content('Edit Quentin Tarantino')
      expect(page).to have_content('Edit Alfred Hitchcock')
      expect(page).to have_content('Edit Woody Allen')

      click_on 'Edit Quentin Tarantino'

      expect(current_path).to eq("/directors/#{@director_1.id}/edit")

      fill_in 'Nominations', with: 25
      click_on 'Update Director'

      expect(current_path).to eq("/directors/#{@director_1.id}")
      expect(page).to have_content('Total Nominations: 25')
    end

    #User story 22
    it 'each director has a link to delete itself' do
      visit '/directors'
      expect(page).to have_content('Delete Quentin Tarantino')
      expect(page).to have_content('Delete Alfred Hitchcock')
      expect(page).to have_content('Delete Woody Allen')

      click_link 'Delete Alfred Hitchcock'
      expect(current_path).to eq('/directors')

      expect(page).to_not have_content('Alfred Hitchcock')
    end
  end
end
