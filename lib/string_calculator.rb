class StringCalculator
  def add(numbers)
    # Extract the custom delimiter
    custom_delimiter = numbers.scan(%r{//\[(.*?)\]}).flatten[0]

    number_list = if custom_delimiter
      # Extract the numbers part of the string
      numbers_part = numbers.split("\n", 2)[1]
      numbers_part.split(custom_delimiter)
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
