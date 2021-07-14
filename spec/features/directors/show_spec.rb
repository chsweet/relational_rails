require 'rails_helper'

RSpec.describe "directors show page", type: :feature do
  describe 'they visit /directors/:id' do
    before :each do
      @director = Director.create!(name: "Woody Allen", oscar: true, nominations: 24)
      @movie_1= @director.movies.create!(title: "Manhattan", oscar: false, nominations: 2)
      @movie_2 = @director.movies.create!(title: "Annie Hall", oscar: true, nominations: 3)
    end

    it 'displays director id and attributes' do
      visit "/directors/#{@director.id}"

      expect(page).to have_content(@director.name)
      expect(page).to have_content("Has Oscar: #{@director.oscar}")
      expect(page).to have_content("Total Nominations: #{@director.nominations}")
    end

    it 'displays the number of movies associated with that director' do
      visit "/directors/#{@director.id}"

      expect(page).to have_content("Total Movies: #{@director.movie_count}")
    end

    it 'displays a link to the movies index page' do
      visit "/directors/#{@director.id}"
      click_on('Movies')

      expect(current_path).to eq('/movies')
    end

    it 'displays a link to the directors index page' do
      visit "/directors/#{@director.id}"
      click_on('Directors')

      expect(current_path).to eq('/directors')
    end

    it 'displays a link to the movies index page specific to that director' do
      visit "directors/#{@director.id}"
      click_on('Movie Index')

      expect(current_path).to eq("/directors/#{@director.id}/movies")
    end

    it 'displays a link to update that director' do
      new_director = Director.create!(name: 'David Lunch', oscar: false, nominations: 4)

      visit "/directors/#{new_director.id}"

      expect(page).to have_content('David Lunch')

      click_link 'Edit David Lunch'
      fill_in 'Name', with: 'David Lynch'
      click_button 'Update Director'

      expect(current_path).to eq("/directors/#{new_director.id}")
      expect(page).to have_content('David Lynch')
    end
  end
end
