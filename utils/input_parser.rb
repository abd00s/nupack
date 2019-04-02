module Utils
  class InputParser
    attr_reader :price, :number_of_people, :category

    def self.run(input_string:)
      new(input_string: input_string).tap(&:parse)
    end

    def initialize(input_string:)
      @input_string = input_string
    end

    def parse
      @price            = parsed_price
      @number_of_people = parsed_number_of_people
      @category         = parsed_category
    end

    private

    def parsed_price
      @parsed_price ||= strip_non_numerical_characters(price_input).to_f
    end

    def price_input
      @price_input ||= split_input[0]
    end

    def parsed_number_of_people
      @parsed_number_of_people ||=
        strip_non_numerical_characters(number_of_people_input).to_i
    end

    def number_of_people_input
      @number_of_people_input ||= split_input[1]
    end

    def parsed_category
      @parsed_category ||= split_input[2]
    end

    def split_input
      @split_input ||= @input_string.split(", ")
    end

    def strip_non_numerical_characters(string)
      string.gsub(/[^\d\.]/, '')
    end
  end
end
