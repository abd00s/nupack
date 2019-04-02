require "./nupack/calculator"
require "./utils/input_parser"
require "./utils/currency_formatter"

class Main
  def initialize(args = {})
    @input = args[:input]
  end

  def self.run(args = {})
    new(args).run
  end

  def run
    formatted_output
  end

  private

  def formatted_output
    @formatted_output ||=
      Utils::CurrencyFormatter.run(price: total_marked_up_price)
  end

  def total_marked_up_price
    @total_marked_up_price ||= Nupack::Calculator.run(
      price:            price,
      number_of_people: number_of_people,
      category:         category
    )
  end

  def price
    @price ||= parsed_input.price
  end

  def number_of_people
    @number_of_people ||= parsed_input.number_of_people
  end

  def category
    @category ||= parsed_input.category
  end

  def parsed_input
    @parsed_input ||= Utils::InputParser.run(input_string: @input)
  end
end
