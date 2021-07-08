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
  end
end
