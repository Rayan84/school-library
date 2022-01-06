class Person
  def initialize(age, name = "Unknown", parent_permission = 'true')
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def id
    @id
  end

  def name
    @name
  end

  def age
    @age
  end

  def setName=(name)
    @name = name
  end

  def setAge=(age)
    @age = age
  end

  def is_of_age?
    if @age < 18
      return false
    else
      return true
    end
  end

  def can_use_services?
    if is_of_age? || @parent_permission
       puts 'true'
    else
      puts 'false'
    end
  end
end


