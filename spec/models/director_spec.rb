require "rails_helper"

describe Director, type: :model do
  describe "validations" do
    it {should have_many(:movies)}
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:created_at)}
    it {should validate_presence_of(:updated_at)}
    it {should validate_presence_of(:oscar)}
    it {should validate_presence_of(:nominations)}
  end
end
