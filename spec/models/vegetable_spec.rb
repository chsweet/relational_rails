require 'rails_helper'

describe Vegetable do
  describe 'validations' do
    it {should belong_to(:garden)}
  end
end
