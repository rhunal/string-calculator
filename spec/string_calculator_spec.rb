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
  end
end
