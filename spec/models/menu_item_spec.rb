require 'rails_helper'

describe MenuItem do
  describe "validations" do

    let(:menu_item) {
      MenuItem.new(name: 'Sesame Chicken', description: 'good', price: '9.95', menu_type_id: '1', category_id: '1')
    }

    it 'must be created with a name' do
      expect(menu_item).to be_valid
      menu_item.name = nil
      expect(menu_item).to_not be_valid
    end

    it 'must be created with a description' do
      expect(menu_item).to be_valid
      menu_item.description = nil
      expect(menu_item).to_not be_valid
    end

    it 'must be created with a price' do
      expect(menu_item).to be_valid
      menu_item.price = nil
      expect(menu_item).to_not be_valid
    end

    it 'must be created with a menu type' do
      expect(menu_item).to be_valid
      menu_item.menu_type_id = nil
      expect(menu_item).to_not be_valid
    end

    it 'must be created with a category' do
      expect(menu_item).to be_valid
      menu_item.category_id = nil
      expect(menu_item).to_not be_valid
    end
  end
end