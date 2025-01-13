class StringCalculator
  def add(numbers)
    return 0 if numbers.empty?

    delimiters = extract_delimiters(numbers)
    numbers_part = extract_numbers_part(numbers, delimiters.any?)

    # Create a regex for splitting numbers
    split_regex = delimiters.any? ? Regexp.union(delimiters) : /[,\n;]/
    number_list = numbers_part.split(split_regex).map(&:to_i)

    validate_no_negatives(number_list)
    number_list.reject { |num| num > 1000 }.sum
  end

  private

  # Extract custom delimiters from the input string
  def extract_delimiters(numbers)
    numbers.scan(%r{\[(.*?)\]}).flatten
  end

  # Extract the numbers part of the input string
  def extract_numbers_part(numbers, has_custom_delimiters)
    has_custom_delimiters ? numbers.split("\n", 2)[1] : numbers.gsub('\\n', "\n")
  end

  # Validate and raise an error if negative numbers are present
  def validate_no_negatives(number_list)
    negatives = number_list.select(&:negative?)
    raise "negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?
  end
end
