require 'rails_helper'

RSpec.describe "movies index page", type: :feature do
  it "displays all titles and their attributes" do
    director = Director.create!(name: "Quentin Tarantino")
    movie_1 = director.movies.create!(title: "Pulp Fiction",
                           oscar: true,
                           nominations: 7)

    movie_2 = director.movies.create!(title: "Kill Bill: Volume 1",
                           oscar: false,
                           nominations: 0)

    visit "/movies"
    save_and_open_page

    expect(page).to have_content(movie_1.title)
    expect(page).to have_content(movie_2.title)
    expect(page).to have_content("Has Oscar: #{movie_1.oscar}")
    expect(page).to have_content("Has Oscar: #{movie_2.oscar}")
    expect(page).to have_content("Nominations: #{movie_1.nominations}")
    expect(page).to have_content("Nominations: #{movie_2.nominations}")
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
