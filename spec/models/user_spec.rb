require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    let(:user) { User.new(name: 'John Doe', email: 'john@example.com', password: 'password') }

    it 'is invalid without a name' do
      user = User.new(email: 'alice@example.com')
      expect(user).to be_invalid
    end

    it 'is invalid without an email' do
      user.email = nil
      expect(user).to be_invalid
    end

    it 'is invalid without a password' do
      user.password = nil
      expect(user).to be_invalid
    end
  end

  describe 'associations' do
    it 'has many entities' do
      association = described_class.reflect_on_association(:entities)
      expect(association.macro).to eq(:has_many)
    end

    it 'has many categories' do
      association = described_class.reflect_on_association(:categories)
      expect(association.macro).to eq(:has_many)
    end
  end
end
