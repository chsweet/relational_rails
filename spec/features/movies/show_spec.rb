require 'rails_helper'

RSpec.describe "movies show page", type: :feature do
  before :each do
    @director = Director.create!(name: "Quentin Tarantino", oscar: true, nominations: 17)
    @movie = @director.movies.create!(title: "Pulp Fiction", oscar: true, nominations: 7)

    @director_2 = Director.create!(name: 'David Lynch')
    @movie_2 = @director_2.movies.create!(title: 'Blue Helmet', oscar: false, nominations: 1)
  end
  describe 'they visit /movies/:id' do
    it 'displays movie id and attributes' do
      visit "/movies/#{@movie.id}"

      expect(page).to have_content(@movie.title)
      expect(page).to have_content("Has Oscar: #{@movie.oscar}")
      expect(page).to have_content("Total Nominations: #{@movie.nominations}")
    end

    it 'displays a link to the movies index page' do
      visit "/movies/#{@movie.id}"
      click_on('Movies')

      expect(current_path).to eq('/movies')
    end

    it 'displays a link to the directors index page' do
      visit "/movies/#{@movie.id}"
      click_on('Directors')

      expect(current_path).to eq('/directors')
    end

    it 'displays a link to update the movie' do
      visit "/directors/#{@director_2.id}/movies"
      expect(page).to have_content('Blue Helmet')

      click_link 'Edit Blue Helmet'
      expect(current_path).to eq("/movies/#{@movie_2.id}/edit")

      fill_in 'Title', with: 'Blue Velvet'
      click_button 'Update Movie'

      expect(current_path).to eq("/movies/#{@movie_2.id}")
      expect(page).to have_content('Blue Velvet')
    end
  end
end
