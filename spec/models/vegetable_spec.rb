require 'rails_helper'

describe Vegetable do
  describe 'validations' do
    it {should belongs_to(:vegetable_garden)}
  end
end
