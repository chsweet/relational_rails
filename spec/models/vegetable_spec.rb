require 'rails_helper'

describe Vegetable do
  describe 'validations' do
    it {should belong_to(:vegetable_garden)}
  end
end
