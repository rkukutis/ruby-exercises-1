
block = lambda {|scientist_name| puts "Welcome to the Black Mesa transit system, #{scientist_name}"}
block.call("Gordon Freeman")

def hello
  if block_given?
    yield
  else
    puts "Hi there, mysterious person"
  end
end

hello {puts "FREEEEEEEEEEEEDOOOOOM"}
hello {}

proc_a = proc {|thing| puts "Just a simple proc that prints #{thing}"}
proc_a.call("DOSH")


square = lambda {|num| num * num}

def lambda_test(function, number)
  function.call(number) + function.call(number)
end

puts lambda_test(square, 5)

def block_storing_method(&block)
  words = %w[Curse you Perry the Platypus]
  words.each {|word| block.call(word)}
  yield("huh")
end


block_storing_method {|x| puts"Printing #{x.upcase}"}

add_one = proc {|num| num + 1}
add_one_lambda = lambda {|num| num + 1}
numbers = [0, 2, 5, 6, 7, 8, 9]
p numbers.map(&:to_s)
p numbers.map &add_one
p numbers.map &add_one_lambda
