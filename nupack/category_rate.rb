module Nupack
  class CategoryRate
    def self.calculate(category_name:)
      new(category_name: category_name).calculate
    end

    def initialize(category_name:)
      @category_name = category_name
    end

    def calculate
      case @category_name
      when /pharmaceuticals|drugs/ then MarkupRates::PHARMACEUTICALS
      when "food"                  then MarkupRates::FOOD
      when "electronics"           then MarkupRates::ELECTRONICS
      end
    end
  end
end
