class StringCalculator
  def add(numbers)
    numbers.gsub('\\n', "\n").split(/[,\n;]/).sum(&:to_i)
  end
end
