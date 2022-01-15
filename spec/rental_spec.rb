require 'date'
require_relative '../rental'

describe Rental do
  date = DateTime.now

  it('Shoud chec if Rental is instance of Rental') do
    mock = double('intance')
    allow(mock).to receive(:rentals) { [] }
    rental = Rental.new(date, mock, mock)
    expect(rental).to be_instance_of(Rental)
  end
end
