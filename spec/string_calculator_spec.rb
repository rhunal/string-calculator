require 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    let(:calculator) { StringCalculator.new }

    context 'when the input is an empty string' do
      it 'returns 0' do
        expect(calculator.add('')).to eq(0)
      end
    end

    context 'when the input is a single number string' do
      it 'returns the number itself' do
        [1, 8].each do |num|
          expect(calculator.add(num.to_s)).to eq(num)
        end
      end
    end

    context 'when the input is a two comma-separated numbers string' do
      it 'returns the sum of the numbers' do
        {
          '1, 2' => 3,
          '8, 5' => 13
        }.each do |input, expected_sum|
          expect(calculator.add(input)).to eq(expected_sum)
        end
      end
    end

    context 'when the input contains multiple comma-separated numbers' do
      it 'returns the sum of the numbers' do
        {
          '1, 2, 3' => 6,
          '1,2, 3,4' => 10,
          '8, 5, 1, 2, 3, 5, 4, 7' => 35
        }.each do |input, expected_sum|
          expect(calculator.add(input)).to eq(expected_sum)
        end
      end
    end

    context 'when the input contains new lines between numbers' do
      it 'returns the sum of the numbers' do
        {
          '1\n2, 3' => 6,
          '8\n5 \n 2' => 15,
          '8, 5\n1, 2, 3\n 5, 4 \n7' => 35
        }.each do |input, expected_sum|
          expect(calculator.add(input)).to eq(expected_sum)
        end
      end
    end

    context 'when the input contains custom delimiters' do
      it 'returns the sum of the numbers' do
        {
          '//;\n1;2' => 3,
          "//;\n1;2,3\n4" => 10
        }.each do |input, expected_sum|
          expect(calculator.add(input)).to eq(expected_sum)
        end
      end
    end

    context 'when the input contains negative numbers' do
      it "raises an exception with 'negative numbers not allowed <negative_number>'" do
        {
          '1,-2,3' => 'negative numbers not allowed: -2',
          '1,-2, -3,-7,-8, -9' => 'negative numbers not allowed: -2, -3, -7, -8, -9'
        }.each do |input, error_message|
          expect { calculator.add(input) }.to raise_error(error_message)
        end
      end
    end

    context 'when the input contains numbers greater than 1000' do
      it 'ignores numbers greater than 1000 and returns the sum of valid numbers' do
        {
          '1,1000' => 1001,
          '1,1001' => 1
        }.each do |input, expected_sum|
          expect(calculator.add(input)).to eq(expected_sum)
        end
      end
    end

    context 'when the input contains custom delimiters of any length' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("//[***]\n1***2***3")).to eq(6)
      end
    end

    context 'when the input contains multiple delimiters' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("//[*][%]\n1*2%3")).to eq(6)
      end
    end

    context 'when the input contains multiple delimiters of any length' do
      it 'returns the sum of the numbers' do
        expect(calculator.add("//[***][%%]\n1***2%%3")).to eq(6)
      end
    end
  end
end
