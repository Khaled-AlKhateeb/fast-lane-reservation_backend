require 'rails_helper'

RSpec.describe User, type: :model do
    it 'should validate presense of name' do
        should validate_presence_of(:name)
    end
    it 'should validate length of name' do
        should validate_length_of(:name).is_at_most(50)
    end
    it 'should validate presense of email' do
        should validate_presence_of(:email)
    end
    it 'should validate uniqueness of email' do
      should validate_uniqueness_of(:email).case_insensitive
    end
    it 'should validate presense of password' do
        should validate_presence_of(:password)
    end
    it 'should validate length of password' do
        should validate_length_of(:password).is_at_least(6)
    end
    it 'should have secure password' do
        should have_secure_password(:password)
    end
    it 'should have many vehicles' do
        should have_many(:vehicles)
    end
    it 'should have many reservations' do
        should have_many(:reservations)
    end
end