require_relative '../corrector'

describe Corrector do
  before(:each) do
    @corrector = Corrector.new
  end
  it('Shoud chec if Corrector is instance of Corrector') do
    expect(@corrector).to be_instance_of Corrector
  end

  describe '#correct_name' do
    it('Should capitalize the string') do
      str = 'mhdez'
      expect(@corrector.correct_name(str)).to eq 'Mhdez'
    end

    it('Should capitalize the string') do
      str = 'tufoin '
      expect(@corrector.correct_name(str)).to eq 'Tufoin'
    end
  end
end
