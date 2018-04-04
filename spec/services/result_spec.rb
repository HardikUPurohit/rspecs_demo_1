require 'rails_helper'

RSpec.describe Result do
  describe '#input_is_matching_generated_number?' do
    it 'returns true when user input is the same as generated number' do
      result_instance = Result.new
      result = result_instance.input_is_matching_generated_number?(input: 1, number: 1)
      expect(result).to eq(true)
    end

    it 'returns false when user input is different than generated number' do
      result_instance = Result.new
      result = result_instance.input_is_matching_generated_number?(input: 1, number: 2)
      expect(result).to eq(false)
    end
  end
end
