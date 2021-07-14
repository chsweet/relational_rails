require 'rails_helper'

RSpec.describe 'Directors movies index' do
  before :each do
    @woody = Director.create!(name: "Woody Allen", oscar: true, nominations: 24)
    @manhattan = @woody.movies.create!(title: "Manhattan",
                                      oscar: false,
                                      nominations: 2)

    @annie = @woody.movies.create!(title: "Annie Hall",
                                  oscar: true,
                                  nominations: 3)
  end
  it 'shows all of the movies and their attributes for that director' do
    visit "/directors/#{@woody.id}/movies"

    expect(page).to have_content(@manhattan.title)
    expect(page).to have_content(@annie.title)
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

  # User Story 16
  it 'is sorted alphabetically by title' do
    paris = @woody.movies.create!(title: "Midnight in Paris",
                                oscar: true,
                                nominations: 4)

    visit "/directors/#{@woody.id}/movies"
    click_link 'Alphabetize Titles'

    expect(@manhattan.title).to appear_before(paris.title)
    expect(@annie.title).to appear_before(@manhattan.title)
    expect(paris.title).to_not appear_before(@annie.title)
  end

  # User Story 18
  it 'has a link to edit each movie' do
    paris = @woody.movies.create!(title: "Midnight in Paris",
                                oscar: true,
                                nominations: 4)

    visit "/directors/#{@woody.id}/movies"

    expect(page).to have_content("Edit Manhattan")
    expect(page).to have_content("Edit Annie Hall")
    expect(page).to have_content("Edit Midnight in Paris")

    click_on 'Edit Manhattan'
    expect(current_path).to eq("/movies/#{@manhattan.id}/edit")

    page.check 'Oscar'
    fill_in 'Nominations', with: 5
    click_on 'Update Movie'

    expect(current_path).to eq("/movies/#{@manhattan.id}")
    expect(page).to have_content("Nominations: 5")
    expect(page).to have_content("Oscar: true")
  end

  #User story 21
  it 'displays a form that takes a number value input' do
    visit "/directors/#{@woody.id}/movies"

    fill_in('Nomination Count', with: 2)
    click_on 'Filter By Nominations'

    expect(current_path).to eq("/directors/#{@woody.id}/movies")
    expect(page).to have_content(@annie.title)
    expect(page).to_not have_content(@manhattan.title)
  end
end
