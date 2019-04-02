module Utils
  class InputParser
    attr_reader :price, :number_of_people, :category

    def initialize(input_string:)
      @input_string = input_string
    end

    def self.run(input_string:)
      new(input_string: input_string).tap(&:parse)
    end

    def parse
      @price            = strip_non_numerical_characters(price_input).to_f
      @number_of_people = strip_non_numerical_characters(
        number_of_people_input
      ).to_i
      @category         = split_input[2]
    end

    private

    def price_input
      @price_input ||= split_input[0]
    end

    def split_input
      @split_input ||= @input_string.split(", ")
    end

    def number_of_people_input
      @number_of_people_input ||= split_input[1]
    end

    def strip_non_numerical_characters(string)
      string.gsub(/[^\d\.]/, '')
    end
  end
end
