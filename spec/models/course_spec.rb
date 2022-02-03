require 'rails_helper'

RSpec.describe Course, type: :model do
  subject do
    described_class.new(title: 'Anything', description: 'Anything', short_description: 'Anything',
                        city: 'Anything', picture: 'Anything', presence: 'true', length: 'anything')
  end

  it 'is not valid without a title'
  it 'is not valid without a description'
  it 'is not valid without a short_description'
  it 'is not valid without a length'
  it 'is not valid without a city'
  it 'is not valid without a picture'
  it 'is not valid without a presence'
end
