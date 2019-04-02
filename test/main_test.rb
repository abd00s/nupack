require "./main"
require "minitest/autorun"
require "minitest/spec"

class MainTest < Minitest::Test
  describe Main do
    describe ".run" do
      it "using the three examples from the prompt, returns correct output" do
        assert_equal Main.run(input: "$1,299.99, 3 people, food"),
                     "$1,591.58"

        assert_equal Main.run(input: "$5,432.00, 1 person, drugs"),
                     "$6,199.81"

        assert_equal Main.run(input: "$12,456.95, 4 people, books"),
                     "$13,707.63"
      end
    end
  end
end
