# spec/models/entity_spec.rb
require 'rails_helper'

RSpec.describe Entity, type: :model do
  describe 'associations' do
    it 'has many categories' do
      association = described_class.reflect_on_association(:categories)
      expect(association.macro).to eq(:has_and_belongs_to_many)
    end
  end

  describe 'validations' do
    let(:user) { User.new(name: 'John Doe', email: 'john@example.com', password: 'password') }

    it 'is invalid without a name' do
      user = User.new(name: 'John Doe')
      expect(user).to be_invalid
    end

    it 'is invalid without an amount' do
      entity = Entity.new(amount: 1)
      entity.amount = nil
      expect(entity).to be_invalid
    end
  end
end
