require 'rails_helper'

RSpec.describe 'Directors movies index' do
  it 'shows all of the movies and their attributes for that director' do
    woody = Director.create!(name: "Woody Allen")
    manhattan = woody.movies.create!(title: "Manhattan",
                                        oscar: false,
                                        nominations: 2)

    annie = woody.movies.create!(title: "Annie Hall",
                                    oscar: true,
                                    nominations: 3)

    visit "/directors/#{woody.id}/movies"

    expect(page).to have_content(manhattan.title)
    expect(page).to have_content(annie.title)
  end

  it 'displays a link to the movies page for that director' do
    woody = Director.create!(name: "Woody Allen")
    manhattan = woody.movies.create!(title: "Manhattan",
                                     oscar: false,
                                     nominations: 2)

    annie = woody.movies.create!(title: "Annie Hall",
                                 oscar: true,
                                 nominations: 3)

    visit "/directors/#{woody.id}/movies"
    save_and_open_page
    click_on manhattan.title

    expect(current_path).to eq("/movies/#{manhattan.id}")
  end

  it 'displays a link to the movies index page' do
    director_1 = Director.create!(name: "Quentin Tarantino", created_at: "23-01-1993")
    director_2 = Director.create!(name: "Alfred Hitchcock", created_at: "14-09-2009" )
    director_3 = Director.create!(name: "Woody Allen", created_at: "16-04-2008")

    visit '/directors'
    save_and_open_page
    click_on('Movies')

    expect(current_path).to eq('/movies')
  end 
end
