require_relative '../classroom'

describe Classroom do
  before(:each) do
    @classroom = Classroom.new('Microverse 2.0')
  end
  it('Shoud chec if Classroom is instance of Classroom') do
    expect(@classroom).to be_instance_of(Classroom)
  end

  it('Shoud verifiy the classroom label') do
    expect(@classroom.label).to eq 'Microverse 2.0'
  end
end
