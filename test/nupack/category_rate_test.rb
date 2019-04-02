require "minitest/autorun"
require "minitest/spec"
require "./nupack/category_rate"
require "./nupack/markup_rates"

class Nupack::CategoryRateTest < Minitest::Test
  describe Nupack::CategoryRate do
    describe "#calculate" do
      it "returns nil when category is not marked up" do
        assert_nil new_instance("Non-marked up category").calculate
      end

      it "returns correct category mark up rate when  present" do
        assert_equal new_instance("pharmaceuticals").calculate,
                     Nupack::MarkupRates::PHARMACEUTICALS

        assert_equal new_instance("drugs").calculate,
                     Nupack::MarkupRates::PHARMACEUTICALS

        assert_equal new_instance("food").calculate,
                     Nupack::MarkupRates::FOOD

        assert_equal new_instance("electronics").calculate,
                     Nupack::MarkupRates::ELECTRONICS
      end
    end

    def new_instance(category)
      Nupack::CategoryRate.new(category_name: category)
    end
  end
end
