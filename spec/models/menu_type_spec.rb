require 'rails_helper'

describe MenuType do
  describe "validations" do
    it 'must be created with a name' do
      menu_type = MenuType.new(name: 'Dinner')
      expect(menu_type).to be_valid
      menu_type.name = nil
      expect(menu_type).to_not be_valid
    end
  end
end