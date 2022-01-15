require_relative '../student'

describe Student do
  before(:each) do
    @student = Student.new('microverse', 27, 'MhdezCoronado')
  end

  it('Shoud check if student is instance of Student') do
    expect(@student).to be_instance_of(Student)
  end

  it('Shoud check if students name is MhdezCoronado') do
    expect(@student.name).to eq('MhdezCoronado')
  end

  it('Shoud check if students age is 27') do
    expect(@student.age).to be < 30
  end

  it('Shoud check if students class is microverse') do
    expect(@student.classroom).to eq('microverse')
  end
end
