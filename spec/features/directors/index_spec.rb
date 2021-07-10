require 'rails_helper'

RSpec.describe "directors index page", type: :feature do
  describe 'they visit /directors' do
    it 'displays all director names' do
      director_1 = Director.create!(name: "Quentin Tarantino")
      director_2 = Director.create!(name: "Alfred Hitchcock")

      visit '/directors'

      expect(page).to have_content(director_1.name)
      expect(page).to have_content(director_2.name)
    end

    it 'displays directors by most recently created with created_at displayed' do
      director_1 = Director.create!(name: "Quentin Tarantino")
      director_2 = Director.create!(name: "Alfred Hitchcock")
      director_3 = Director.create!(name: "Woody Allen")

      visit '/directors'
      save_and_open_page
      
      expect(page).to have_content(director_1.created_at)
      expect(page).to have_content(director_2.created_at)
      expect(page).to have_content(director_3.created_at)
    end
  end
end
