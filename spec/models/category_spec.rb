require 'rails_helper'

describe Category do
  describe "validations" do

    let(:category) {Category.new(name: 'Beef')}

    it 'must be created with a name' do
      expect(category).to be_valid
      category.name = nil
      expect(category).to_not be_valid
    end

    it 'must have unique name' do
      expect(category).to be_valid
      Category.create!(name: 'Beef')
      expect(category).to_not be_valid
    end
  end
end