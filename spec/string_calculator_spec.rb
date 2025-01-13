require 'string_calculator'

RSpec.describe StringCalculator do
  describe '#add' do
    let(:calculator) { StringCalculator.new }

    context 'when the input is an empty string' do
      it 'should return 0' do
        expect(calculator.add('')).to eq(0)
      end
    end
  end
end
