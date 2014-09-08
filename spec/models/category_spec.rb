require 'rails_helper'

describe Category do
  describe "validations" do
    it 'must be created with a name' do
      category = Category.new(name: 'Beef')
      expect(category).to be_valid
      category.name = nil
      expect(category).to_not be_valid
    end
  end
end