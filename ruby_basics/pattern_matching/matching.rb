login = { username: 'hornby', password: 'iliketrains' }

login => { username: username, password: password }

puts "Logged in with username #{username} and password #{password}"

number = 42

case number
in 2 | 45 | 42 => a
  puts a
end

case 42
in Integer if number % 10 == 2
  :no_way
end

case ["huh", "42"]
in [Integer, Integer]
  puts "all numbers"
in [String, String]
  puts "all strings"
in [String, Integer] | [Integer, String]
  puts "Mixed array"
end

arr = [1, 2, 3, 4, 5, 6, 7, 8]
case arr
in [hmm , Integer, *, 7, 8]
  puts :match
end

json = {isActive: true, user: {name: "Garry", address: "Vault 108", details: ["Garry :)", "Garry >:d"]}}

case json
in user:{details:[String, *details]}
  puts details
end

data = [
  {name: 'James', age: 50, first_language: 'english', job_title: 'general manager'},
  {name: 'Jill', age: 32, first_language: 'italian', job_title: 'leet coder'},
  {name: 'Helen', age: 24, first_language: 'dutch', job_title: 'biscuit quality control'},
  {name: 'Bob', age: 64, first_language: 'english', job_title: 'table tennis king'},
  {name: 'Betty', age: 55, first_language: 'spanish', job_title: 'pie maker'},
]

name = "Bob"
age = 64
job_title = "table tennis king"

case data
in [*,{name: ^name, age: ^age, first_language: language, job_title: ^job_title},*]
else
  language = nil
end

p language