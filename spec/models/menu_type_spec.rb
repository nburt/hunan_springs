require 'rails_helper'

describe MenuType do
  describe "validations" do

    let(:menu_type) { MenuType.new(name: 'Dinner')}

    it 'must be created with a name' do
      expect(menu_type).to be_valid
      menu_type.name = nil
      expect(menu_type).to_not be_valid
    end

    it 'must have a unique name' do
      expect(menu_type).to be_valid
      MenuType.create!(name: 'Dinner')
      expect(menu_type).to_not be_valid
    end
  end
end