module Utils
  class CurrencyFormatter
    def self.run(price:)
      new(price: price).format_currency
    end

    def initialize(price:)
      @price = price
    end

    def format_currency
      "$#{total_with_thousands_comma_separators}"
    end

    private

    def total_with_thousands_comma_separators
      @total_with_thousands_comma_separators ||=
        rounded_total_string.gsub(/(\d)(?=\d{3}+\.)/, '\1,')
    end

    def rounded_total_string
      @rounded_total_string ||= format("%.2f", @price)
    end
  end
end
