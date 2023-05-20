# spec/models/entity_spec.rb
require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'associations' do
    it 'should belong to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'has many entities' do
      association = described_class.reflect_on_association(:entities)
      expect(association.macro).to eq(:has_and_belongs_to_many)
    end
  end

  describe 'validations' do
    let(:category) { Category.new(name: 'Groceries', icon: 'test.jpg') }

    it 'is invalid without a name' do
      category = Category.new(name: 'Groceries')
      expect(category).to be_invalid
    end

    it 'is invalid without an icon' do
      category = Category.new(icon: 'test.jpg')
      category.icon = nil
      expect(category).to be_invalid
    end
  end
end
