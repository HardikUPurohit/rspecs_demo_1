require 'rails_helper'

RSpec.describe Guard do
  describe "#can_participate_in_lottery?" do
    it 'returns true if user age is greater than 17' do
      service = Guard.new
      expect(service.can_participate_in_lottery?(age: 20)).to eq(true)
    end

    it 'returns false if user age is not greater than 17' do
      service = Guard.new
      expect(service.can_participate_in_lottery?(age: 16)).to eq(false)
    end
  end
end
