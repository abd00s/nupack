require "./nupack/calculator"
require "minitest/autorun"
require "minitest/spec"

class Nupack::CalculatorTest < Minitest::Test
  describe Nupack::Calculator do
    describe ".run" do
      it "computes the total price and returns it as a float" do
        nupack_calculator = Nupack::Calculator.run(
          price:            9999,
          number_of_people: 4,
          category:         "drugs"
        )

        assert nupack_calculator.class == Float
      end
    end
  end
end
