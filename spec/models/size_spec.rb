require 'rails_helper'

describe Size do
  describe "validations" do
    it 'must be created with a name' do
      size = Size.new(name: 'Small')
      expect(size).to be_valid
      size.name = nil
      expect(size).to_not be_valid
    end
  end
end