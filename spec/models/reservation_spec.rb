require 'rails_helper'

RSpec.describe Reservation, type: :model do
    it 'should validate presence of from_date column' do
        should validate_presence_of(:from_date)
    end
    it 'should validate presence of to_date column' do
        should validate_presence_of(:to_date)
    end
    it 'should belong to user' do
        should belong_to(:user)
    end
    it 'should belong to vehicle' do
        should belong_to(:vehicle)
    end
end