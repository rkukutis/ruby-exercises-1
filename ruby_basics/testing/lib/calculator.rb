class MyRandomGenerator

  def get_random_int
    (Random.rand * 10).to_i
  end

end




class Calculator

  attr_accessor :random_generator

  def initialize(random_generator = MyRandomGenerator.new)
    @random_generator = random_generator
  end

  def add(*args)
    args.reduce {|acc, cur| acc + cur}
  end
  
  def subtract(number, subtract_by)
    number - subtract_by
  end

  def multiply(*args)
    args.reduce {|acc, cur| acc * cur}
  end

  def divide(number, divide_by)
    number / divide_by
  end

  def add_random_number(starting_number)
    starting_number + random_generator.get_random_int
  end
end

rand_gen = MyRandomGenerator.new
calculator = Calculator.new(rand_gen)

# puts calculator.add_random_number(5)