module Nupack
  class CategoryRate
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
