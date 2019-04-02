require "./nupack/markup_rates"
require "./nupack/category_rate"

module Nupack
  class Calculator
    def self.run(args = {})
      new(args).rounded_total
    end

    def initialize(args = {})
      @price            = args[:price]
      @number_of_people = args[:number_of_people]
      @category         = args[:category]
    end

    def rounded_total
      total.round(2)
    end

    private

    def total
      flat_marked_up_base_price + labor_markup + category_markup
    end

    def flat_marked_up_base_price
      @flat_marked_up_base_price ||= @price + flat_markup
    end

    def flat_markup
      @flat_markup ||= @price * MarkupRates::FLAT
    end

    def labor_markup
      @labor_markup ||= flat_marked_up_base_price * labor_rate
    end

    def labor_rate
      @labor_rate ||= @number_of_people * MarkupRates::PER_LABORER
    end

    def category_markup
      return 0 if category_rate.nil?

      @category_markup ||= flat_marked_up_base_price * category_rate
    end

    def category_rate
      @category_rate ||= CategoryRate.new(category_name: @category).calculate
    end
  end
end
