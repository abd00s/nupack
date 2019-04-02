require "minitest/autorun"
require "minitest/spec"
require "./utils/input_parser"

class Utils::InputParserTest < Minitest::Test
  describe Utils::InputParser do
    def setup
      @input_parser = Utils::InputParser.new(
        input_string: "$1,000, 3 people, sample_category")
    end

    describe "#parse" do
      it "computes and assigns the object's public attributes" do
        @input_parser.parse

        refute_nil @input_parser.price
        refute_nil @input_parser.number_of_people
        refute_nil @input_parser.category
      end

      describe "with invalid input" do
        it "raises an ArgumentError with clarifying instrction" do
          invalid_parser = Utils::InputParser.new(
          input_string: "$1,000, 3 people")

          error = assert_raises(ArgumentError) { invalid_parser.parse }
          assert_match /ensure input is/, error.message
        end
      end
    end

    describe "#strip_non_numerical_characters(string)" do
      it "removes non-numeric characters (symbols/alpha) from string" do
        assert_equal @input_parser
          .send(:strip_non_numerical_characters, "1 person"),
          "1"

        assert_equal @input_parser
          .send(:strip_non_numerical_characters, "$100"),
          "100"
      end
    end
  end
end
