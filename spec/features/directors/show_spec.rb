require 'rails_helper'

RSpec.describe "directors show page", type: :feature do
  describe 'they visit /directors/:id' do
    it 'displays director id and attributes' do
      director_1 = Director.create!(name: "Quentin Tarantino", oscar: true, nominations: 17)

      visit "/directors/#{director_1.id}"
      # save_and_open_page

      expect(page).to have_content(director_1.name)
      expect(page).to have_content("Has Oscar: #{director_1.oscar}")
      expect(page).to have_content("Total Nominations: #{director_1.nominations}")
    end

      it 'displays the number of movies associated with that director' do
        woody = Director.create!(name: "Woody Allen")
        manhattan = woody.movies.create!(title: "Manhattan",
                                          oscar: false,
                                          nominations: 2)

        annie = woody.movies.create!(title: "Annie Hall",
                                    oscar: true,
                                    nominations: 3)

        visit "/directors/#{woody.id}"
        save_and_open_page

        expect(page).to have_content("Total Movies: #{woody.movie_count}")
    end
  end
end
