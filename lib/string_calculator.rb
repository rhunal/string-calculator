class StringCalculator
  def add(numbers)
    # Extract the custom delimiter
    delimiters = numbers.scan(%r{\[(.*?)\]}).flatten

    number_list = if delimiters.any?
      # Create a regular expression to split by multiple delimiters
      delimiter_regex = Regexp.union(delimiters)

      # Extract the numbers part of the string
      numbers_part = numbers.split("\n", 2)[1]
      numbers_part.split(delimiter_regex)
    else
      # Convert escaped newline, split by delimiters, and convert to integers
      numbers.gsub('\\n', "\n").split(/[,\n;]/)
    end.map(&:to_i)
    negative_numbers = number_list.select(&:negative?)

    raise "negative numbers not allowed: #{negative_numbers.join(', ')}" unless negative_numbers.empty?

    numbers_bigger_than_thousand = number_list.select { |num| num > 1000 }
    number_list -= numbers_bigger_than_thousand unless numbers_bigger_than_thousand.empty?
    number_list.sum
  end
end
