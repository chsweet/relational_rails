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
      director_1 = Director.create!(name: "Quentin Tarantino", created_at: "23-01-1993")
      director_2 = Director.create!(name: "Alfred Hitchcock", created_at: "14-09-2009" )
      director_3 = Director.create!(name: "Woody Allen", created_at: "16-04-2008")

      visit '/directors'
      save_and_open_page

      expect(director_1.name).to appear_before(director_2.name, text_only: true)
      expect(director_2.name).to_not appear_before(director_3.name, text_only: true)
    end
  end
end
