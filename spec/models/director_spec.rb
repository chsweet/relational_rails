require "rails_helper"

describe Director, type: :model do
  describe "validations" do
    it {should have_many(:movies)}
  end
  
  describe 'movie_count' do
    it 'returns an integer count of the movies for that director' do
      woody = Director.create!(name: "Woody Allen", oscar: true, nominations: 24)
      manhattan = woody.movies.create!(title: "Manhattan",
                                        oscar: false,
                                        nominations: 2)

      annie = woody.movies.create!(title: "Annie Hall",
                                    oscar: true,
                                    nominations: 3)

      expect(woody.movie_count).to eq(2)
    end
  end
end
