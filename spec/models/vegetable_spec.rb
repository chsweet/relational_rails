require 'rails_helper'

describe Vegetable do
  describe 'validations' do
    it {should have_many(:vegetable_gardens)}
  end
end
