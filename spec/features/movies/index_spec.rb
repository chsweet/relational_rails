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
end
