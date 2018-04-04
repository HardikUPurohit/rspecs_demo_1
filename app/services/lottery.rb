require 'generator'
require 'result'
require 'guard'
class Lottery
  attr_reader :age

  def initialize(age:)
    @age = age
  end

  def play(number:)
    return "You are too young!" unless user_old_enough?

    if result.input_is_matching_generated_number?(input: number, number: generated_number)
      'Congratulations, you won lottery!'
    else
      'Not this time!'
    end
  end

  private

  def guard
    Guard.new
  end

  def user_old_enough?
    guard.can_participate_in_lottery?(age: age)
  end

  def generated_number
    Generator.generate_random_number_from_1_to_10
  end

  def result
    Result.new
  end
end
