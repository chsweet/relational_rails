require "rails_helper"

describe Movie, type: :model do
  describe "relationships" do
    it {should belong_to(:director)}
    it {should validate_presence_of(:title)}
    it {should validate_presence_of(:created_at)}
    it {should validate_presence_of(:updated_at)}
    it {should validate_presence_of(:oscar)}
    it {should validate_presence_of(:nominations)}
  end
end
