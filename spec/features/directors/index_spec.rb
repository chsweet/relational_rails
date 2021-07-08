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

    it 'displays director id and attributes' do
      director_1 = Director.create!(id: 1, name: "Quentin Tarantino", oscar: true, nominations: 17)

      visit '/directors'

      expect(page).to have_content(director_1.id)
      expect(page).to have_content(director_1.name)
      expect(page).to have_content(director_1.oscar)
      expect(page).to have_content(director_1.nominations)
    end
  end
end
