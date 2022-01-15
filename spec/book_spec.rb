require_relative '../book'

describe Book do
  before(:each) do
    @book = Book.new 'Lord fo the Rings', 'Tolkien'
  end

  it('Shoud chec if book is instance of Book') do
    expect(@book).to be_instance_of(Book)
  end

  it('Shoud check if book has author attribute') do
    expect(@book).to have_attributes(author: 'Tolkien')
  end

  it('Shoud check if book has title attribute') do
    expect(@book).to have_attributes(title: 'Lord fo the Rings')
  end
end
