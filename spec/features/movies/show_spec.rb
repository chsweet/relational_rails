require 'rails_helper'

RSpec.describe "movies show page", type: :feature do
  describe 'they visit /movies/:id' do
    it 'displays movie id and attributes' do
      director = Director.create!(name: "Quentin Tarantino", oscar: true, nominations: 17)
      movie_1 = director.movies.create!(title: "Pulp Fiction",
                                        oscar: true,
                                        nominations: 7)

      visit "/movies/#{movie_1.id}"

      expect(page).to have_content(movie_1.title)
      expect(page).to have_content("Has Oscar: #{movie_1.oscar}")
      expect(page).to have_content("Total Nominations: #{movie_1.nominations}")
    end

    it 'displays a link to the movies index page' do
      director = Director.create!(name: "Quentin Tarantino", oscar: true, nominations: 17)
      movie_1 = director.movies.create!(title: "Pulp Fiction",
                                        oscar: true,
                                        nominations: 7)

      visit '/directors'
      click_on('Movies')

      expect(current_path).to eq('/movies')
    end

    it 'displays a link to the directors index page' do
      director = Director.create!(name: "Quentin Tarantino", oscar: true, nominations: 17)
      movie_1 = director.movies.create!(title: "Pulp Fiction",
                                        oscar: true,
                                        nominations: 7)

      visit '/directors'
      click_on('Directors')

      expect(current_path).to eq('/directors')
    end

    it 'displays a link to update the movie' do
      director = Director.create!(name: 'David Lynch')
      movie = director.movies.create!(title: 'Blue Helmet', oscar: false, nominations: 1)

      visit "/directors/#{director.id}/movies"
      expect(page).to have_content('Blue Helmet')
      # save_and_open_page

      click_link 'Edit Blue Helmet'
      expect(current_path).to eq("/movies/#{movie.id}/edit")

      fill_in 'Title', with: 'Blue Velvet'
      click_button 'Update Movie'
      save_and_open_page
      
      expect(current_path).to eq("/movies/#{movie.id}")
      expect(page).to have_content('Blue Velvet')
    end
  end
end
