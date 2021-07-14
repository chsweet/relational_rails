require 'rails_helper'

RSpec.describe 'Directors movies index' do
  before :each do
    @director = Director.create!(name: "Woody Allen", oscar: true, nominations: 24)
    @movie_1 = @director.movies.create!(title: "Manhattan", oscar: false, nominations: 2)
    @movie_2 = @director.movies.create!(title: "Annie Hall", oscar: true, nominations: 3)
  end

  it 'shows all of the movies and their attributes for that director' do
    visit "/directors/#{@director.id}/movies"

    expect(page).to have_content(@movie_1.title)
    expect(page).to have_content(@movie_2.title)
  end

  it 'displays a link to the movies index page' do
    visit "/directors/#{@director.id}/movies"
    click_on('Movies')

    expect(current_path).to eq('/movies')
  end

  it 'displays a link to the directors index page' do
    visit "/directors/#{@director.id}/movies"
    click_on('Directors')

    expect(current_path).to eq('/directors')
  end

  # User Story 16
  it 'is sorted alphabetically by title' do
    movie_3 = @director.movies.create!(title: "Midnight in Paris", oscar: true, nominations: 4)

    visit "/directors/#{@director.id}/movies"
    click_link 'Alphabetize Titles'

    expect(@movie_1.title).to appear_before(movie_3.title)
    expect(@movie_2.title).to appear_before(@movie_1.title)
    expect(movie_3.title).to_not appear_before(@movie_2.title)
  end

  # User Story 18
  it 'has a link to edit each movie' do
    visit "/directors/#{@director.id}/movies"

    expect(page).to have_content("Edit Manhattan")
    expect(page).to have_content("Edit Annie Hall")

    click_on 'Edit Manhattan'
    expect(current_path).to eq("/movies/#{@movie_1.id}/edit")

    page.check 'Oscar'
    fill_in 'Nominations', with: 5
    click_on 'Update Movie'

    expect(current_path).to eq("/movies/#{@movie_1.id}")
    expect(page).to have_content("Nominations: 5")
    expect(page).to have_content("Oscar: true")
  end

  #User story 21
  it 'displays a form that takes a number value input' do
    visit "/directors/#{@director.id}/movies"

    fill_in('Nomination Count', with: 2)
    click_on 'Filter By Nominations'

    expect(current_path).to eq("/directors/#{@director.id}/movies")
    expect(page).to have_content(@movie_2.title)
    expect(page).to_not have_content(@movie_1.title)
  end
end
