require "minitest/autorun"
require "minitest/spec"
require "./utils/currency_formatter"

class Utils::CurrencyFormatterTest < Minitest::Test
  describe Utils::CurrencyFormatter do
    describe "#total_with_thousands_comma_separators" do
      it "converts the numerical value to a string" do
        assert new_instance(1111.11)
          .send(:total_with_thousands_comma_separators)
          .class == String
      end

      it "adds comma as thousands seaprator after every 3rd digit" do
        assert_equal new_instance(1111.11)
          .send(:total_with_thousands_comma_separators),
                     "1,111.11"

        assert_equal new_instance(1111111.11)
          .send(:total_with_thousands_comma_separators),
                     "1,111,111.11"
      end

      it "does not add commas when the value is smaller than 1000" do
        assert_equal new_instance(111.11)
          .send(:total_with_thousands_comma_separators),
                     "111.11"

        assert_equal new_instance(11.11)
          .send(:total_with_thousands_comma_separators),
                     "11.11"

        assert_equal new_instance(1.11)
          .send(:total_with_thousands_comma_separators),
                     "1.11"
      end
    end

    def new_instance(price)
      Utils::CurrencyFormatter.new(price: price)
    end
  end
end
