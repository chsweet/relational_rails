require 'rails_helper'

RSpec.describe "directors show page", type: :feature do
  describe 'they visit /directors/:id' do
    before :each do
      @woody = Director.create!(name: "Woody Allen", oscar: true, nominations: 24)
      @manhattan = @woody.movies.create!(title: "Manhattan",
                                         oscar: false,
                                         nominations: 2)

      @annie = @woody.movies.create!(title: "Annie Hall",
                                     oscar: true,
                                     nominations: 3)
    end

    it 'displays director id and attributes' do
      visit "/directors/#{@woody.id}"

      expect(page).to have_content(@woody.name)
      expect(page).to have_content("Has Oscar: #{@woody.oscar}")
      expect(page).to have_content("Total Nominations: #{@woody.nominations}")
    end

    it 'displays the number of movies associated with that director' do
      visit "/directors/#{@woody.id}"

      expect(page).to have_content("Total Movies: #{@woody.movie_count}")
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

    it 'displays a link to the movies index page specific to that director' do
      visit "directors/#{@woody.id}"

      click_on('Movie Index')

      expect(current_path).to eq("/directors/#{@woody.id}/movies")
    end

    it 'displays a link to update that director' do
      director = Director.create!(name: 'David Lunch')

      visit "/directors/#{director.id}"

      expect(page).to have_content('David Lunch')

      click_link 'Edit David Lunch'

      fill_in 'Name', with: 'David Lynch'
      click_button 'Update Director'
      
      save_and_open_page

      expect(current_path).to eq("/directors/#{director.id}")
      expect(page).to have_content('David Lynch')
    end
  end
end
