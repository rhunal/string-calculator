class StringCalculator
  def add(numbers)
    # Convert escaped newline, split by delimiters, and convert to integers
    number_list = numbers.gsub('\\n', "\n").split(/[,\n;]/).map(&:to_i)
    negative_numbers = number_list.select(&:negative?)

    raise "negative numbers not allowed: #{negative_numbers.join(', ')}" unless negative_numbers.empty?

    number_list.sum
  end
end
