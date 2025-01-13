require 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    let(:calculator) { StringCalculator.new }

    context 'when the input is an empty string' do
      it 'should return 0' do
        expect(calculator.add('')).to eq(0)
      end
    end

    context 'when the input is a single number string' do
      it 'should return number itself' do
        expect(calculator.add('1')).to eq(1)
        expect(calculator.add('8')).to eq(8)
      end
    end

    context 'when the input is a two comma-separated numbers string' do
      it 'should return the sum of numbers' do
        expect(calculator.add('1, 2')).to eq(3)
        expect(calculator.add('8, 5')).to eq(13)
      end
    end

    context 'when the input is a multiple comma-separated numbers string' do
      it 'should return the sum of numbers' do
        expect(calculator.add('1, 2, 3')).to eq(6)
        expect(calculator.add('1,2, 3,4')).to eq(10)
        expect(calculator.add('8, 5, 1, 2, 3, 5, 4, 7')).to eq(35)
      end
    end

    context 'when the input is having new lines between numbers string' do
      it 'should return the sum of numbers' do
        expect(calculator.add('1\n2, 3')).to eq(6)
        expect(calculator.add('8\n5 \n 2')).to eq(15)
        expect(calculator.add('8, 5\n1, 2, 3\n 5, 4 \n7')).to eq(35)
      end
    end

    context 'when the input is having different delimiters betwen numbers string' do
      it 'should return the sum of numbers' do
        expect(calculator.add('//;\n1;2')).to eq(3)
        expect(calculator.add("//;\n1;2,3\n4")).to eq(10)
      end
    end

    context 'when the input contains negative numbers' do
      it "should throw an exception as 'negative numbers not allowed <negative_number>'" do
        expect do
          calculator.add('1,-2,3')
        end.to raise_error('negative numbers not allowed: -2')

        expect do
          calculator.add('1,-2, -3,-7,-8, -9')
        end.to raise_error('negative numbers not allowed: -2, -3, -7, -8, -9')
      end
    end

    context 'when the input contains numbers bigger than 1000' do
      it 'should ignore numbers bigger than 1000 and return the sum of valid numbers' do
        expect(calculator.add('1,1000')).to eq(1001)
        expect(calculator.add('1,1001')).to eq(1)
      end
    end

    context 'when the input contains custom delimiters of any length' do
      it 'should handle a multi-character custom delimiter' do
        expect(calculator.add("//[***]\n1***2***3")).to eq(6)
      end
    end
  end
end
