require_relative '../solver'

describe Solver do
  before(:each) do
    @solver = Solver.new
  end

  describe '#factorial' do
    it('should check of factorial of a number') do
      expect(@solver.factorial(3)).to eq 6
    end

    it('should check of factorial of a number') do
      expect(@solver.factorial(5)).to eq 120
    end

    it('should check of factorial of a number') do
      expect(@solver.factorial(0)).to eq 1
    end
  end

  describe '#fizzbuzz' do
    it 'Should verify if the number is multiple of 3 and 5' do
      expect(@solver.fizzbuzz(15)).to eq 'fizzbuzz'
    end

    it 'Should verify if the number is multiple of 3' do
      expect(@solver.fizzbuzz(6)).to eq 'fizz'
    end

    it 'Should verify if the number is multiple of 5' do
      expect(@solver.fizzbuzz(10)).to eq 'buzz'
    end

    it 'Should return same number if not divisible 3 and 5' do
      expect(@solver.fizzbuzz(22)).to eql 22
    end
  end

  describe '#reverse' do
    it 'Should reverse a word the oposite way' do
      expect(@solver.reverse('hello')).to eq 'olleh'
    end

    it 'Should reverse a word the oposite way' do
      expect(@solver.reverse('good')).to eq 'doog'
    end
  end
end
