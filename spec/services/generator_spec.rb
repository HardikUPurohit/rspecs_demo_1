require 'rails_helper'

RSpec.describe Generator do
  describe '#generate_random_number_from_1_to_10' do
    it 'generates random number' do
      allow(Kernel).to receive(:rand).with(1..10).and_return(1)
      result = Generator.generate_random_number_from_1_to_10
      expect(result).to eq (1)
    end
  end
end
