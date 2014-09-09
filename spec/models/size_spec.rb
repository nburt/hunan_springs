require 'rails_helper'

describe Size do
  describe "validations" do

    let(:size) {Size.new(name: 'Small')}

    it 'must be created with a name' do
      expect(size).to be_valid
      size.name = nil
      expect(size).to_not be_valid
    end

    it 'must have a unique name' do
      expect(size).to be_valid
      Size.create!(name: 'Small')
      expect(size).to_not be_valid
    end
  end
end