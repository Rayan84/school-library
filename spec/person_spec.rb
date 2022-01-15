require_relative '../person'

describe Person do
  person = Person.new(23)
  it 'Shoud create a person' do
    expect(person.age).to eql 23
  end

  it 'Shoud check if person has no name' do
    expect(person.name).to eql 'Unknown'
  end

  it 'Shoud check if person has no name' do
    expect(person.name).not_to eql 'Something'
  end

  it 'Shoud Correct the name' do
    person = Person.new(30, 'mhdez')
    person.validate_name
    expect(person.name).to eql 'Mhdez'
  end

  it 'Shoud check if person has parent permission' do
    expect(person.parent_permission).to eq 'true'
  end

  it 'Shoud check if the person is not under age' do
    expect(person.age).not_to be < 18
  end

  it 'Shoud check if the person adult but no old' do
    expect(person.age).to be_between(18, 35)
  end

  it 'Shoud compare the name agins un imput' do
    expect(person.name).to match(/MhDEz/i)
  end

  it 'Shoud check if person is instance of Person class' do
    expect(person).to be_instance_of Person
  end

  it 'Shoud chec if age if type of number' do
    expect(person.age).to be_kind_of Numeric
  end

  it 'Shoud chec if age if type of number' do
    expect { person.something }.to raise_error(NoMethodError)
  end

  it 'Generate a random number' do
    allow(person).to receive(:id).and_return(402)
    expect(person.id).to eq(402)
  end
end
