require 'rails_helper'
RSpec.describe Lottery do
  describe "#play" do
    it 'returns success message when user win the lottery' do
      result_service = Result.new
      allow(result_service).to receive(:input_is_matching_generated_number?).with(input: 5, number: 5).and_return(true)
      allow(Generator).to receive(:generate_random_number_from_1_to_10).and_return(5)

      lottery = Lottery.new(age: 20)
      result = lottery.play(number: 5)
      expect(result).to eq('Congratulations, you won lottery!')
    end

    it 'returns failure message when user does not win the lottery' do
      result_service = Result.new
      allow(result_service).to receive(:input_is_matching_generated_number?).with(input: 5, number: 5).and_return(false)
      allow(Generator).to receive(:generate_random_number_from_1_to_10).and_return(6)

      lottery = Lottery.new(age: 20)
      result = lottery.play(number: 5)
      expect(result).to eq('Not this time!')
    end

    it 'returns failure message when user is too young to play' do
      guard = Guard.new
      allow(guard).to receive(:can_participate_in_lottery?).with(age: 15).and_return(false)
      lottery = Lottery.new(age: 15)
      result = lottery.play(number: 5)
      expect(result).to eq("You are too young!")
    end
  end
end
