require "rails_helper"

describe Director, type: :model do
  describe "validations" do
    it {should have_many(:movies)}
  end
end
