class ScientificOrganization
  attr_accessor :name

  def initialize(name)
    self.name = name
  end

  def conduct_experiment()
    if Random.rand < 0.5
      puts "Experiment has been successfull :)"
      0
    else
      puts "Experiment has failed ;("
      -1
    end
  end
  
  def welcome_visitor(visitor_name)
    puts "Welcome to the #{self.name} research facility, #{visitor_name}"
  end
end

scientific_org = ScientificOrganization.new("Black Mesa")
scientific_org.conduct_experiment
scientific_org.welcome_visitor("Barney")
scientific_org.name = "Aperture Science"
scientific_org.welcome_visitor("Caroline")

#///////////////////////////////////////////////////////////////////////////////////

class MyCar
  attr_reader :year, :color

  def initialize(year = 1998, color = "Maroon", model = "Mercedes-Benz")
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up(increase_amount)
    puts "Increasing speed from #{@speed} to #{@speed + increase_amount}"
    @speed += increase_amount
  end

  def brake(brake_amount)
    @speed = @speed - brake_amount > 0 ? @speed - brake_amount : 0
    puts "Breaking until speed reaches #{@speed}"
  end

  def shutdown
    puts "Breaking to 0 and shutting down engine"
    @speed = 0
  end

  def spray_paint(new_color)
    puts "Painting car to #{new_color} from #{@color}"
    @color = new_color
  end

  def self.calulate_kilometrage(liters, kilometers)
    "Kilometrage is #{format('%.2f', kilometers.to_f / liters.to_f)}"
  end
end

car = MyCar.new()
car.speed_up(70)
car.brake(150)
car.speed_up(100)
car.brake(42)

car.spray_paint("Prussian Blue")
puts "This car is from #{car.year} and its color is #{car.color}"
car.shutdown

puts MyCar.calulate_kilometrage(2.1, 100)

#///////////////////////////////////////////////////////////////////////////////

class Doggie
  @@number_of_instances = 0
  attr_reader :name

  def initialize(name)
    @@number_of_instances += 1
    @name = name
  end

  def identify
    puts "I am #{self.class.identify} named #{@name}"
  end

  # static method
  def self.identify
    "A dog"
  end

  def self.number_of_instances
    @@number_of_instances
  end

  def to_s
    "A good doggie named #{@name}"
  end

  def puts_self_name
    puts self.name
  end
end

Doggie.identify
rex = Doggie.new("Rex")
puts Doggie.number_of_instances
rex.identify
puts rex
rex.puts_self_name

#/////////////////////////////////////////////////////

module ShadyScientificOrgs
  class BlackMesa < ScientificOrganization
    attr_reader :days_since_last_accident, :employees
  
    def initialize
      super("Black mesa")
      @days_since_last_accident = 0
      @employees = ["Barney Calhoun"]
    end
  
    def conduct_experiment(specimen = "a normal specimen")
      if specimen == "xen crystal" || gman_shenanigans
        puts "An resonance cascade has occured!"
        @days_since_last_accident = 0
      else
        super()
        @days_since_last_accident += 1
      end
    end

    private

    def add_employee(name)
      @employees.push(name)
    end

    def gman_shenanigans
      if Random.rand < 0.8
        puts "Prepare for unforeseen consequences"
        true
      else
        puts "Buisiness as usual"
        false
      end
    end
  end
end



black_mesa = ShadyScientificOrgs::BlackMesa.new
black_mesa.conduct_experiment
black_mesa.conduct_experiment("xen crystal")

# singleton method

p black_mesa.employees
def black_mesa.hire_freeman
  puts "Hiring Gordon Freeman"
  add_employee("Gordon Freeman")
end

black_mesa.hire_freeman
p black_mesa.employees