require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  it 'should validate name presence' do
     should validate_presence_of(:name)
  end
  it 'should validate price presence' do
     should validate_presence_of(:price)
  end
  it 'should validate price presence' do
    should validate_numericality_of(:price).only_integer.is_greater_than(0)
  end
  it 'should validate model presence' do
     should validate_presence_of(:model)
  end
  it 'should validate description presence' do
     should validate_presence_of(:description)
  end
  it 'should validate image presence' do
     should validate_presence_of(:image)
  end
  it 'should validate horse_power presence' do
     should validate_presence_of(:horse_power)
  end
 
  it 'should belong to user' do
    should belong_to(:user)
  end
  it 'should have many reservations' do
    should have_many(:reservations)
  end

end