require './lib/calculator.rb'

describe Calculator do

  describe "add" do

    it "returns the sum of the provided values" do
      calculator = Calculator.new
      expect(calculator.add(5, 7)).to eql(12)
    end

    it "sums up an arbitrary number of arguments" do
      calculator = Calculator.new
      expect(calculator.add(1, 2, 3, 4)).to eql(10)
    end
  end

  describe "add_random_number" do

    it "adds number provided by MyRandomGenerator object" do
      rand_generator = MyRandomGenerator.new
    
      def rand_generator.get_random_int
        42
      end
  
      calculator = Calculator.new(rand_generator)
      expect(calculator.add_random_number(8)).to eql(50)
    end
    
  end

  describe "subtract" do

    it "subtracts from first argument by the second argument" do
      calculator = Calculator.new
      expect(calculator.subtract(10, 4)).to eql(6)
    end

    it "adds second argument if it is negative" do
      calculator = Calculator.new
      expect(calculator.subtract(10, -4)).to eql(14)
    end
  end

  describe "divide" do

    it "divides first argument by second" do
      calculator = Calculator.new
      expect(calculator.divide(10, 5)).to eql(2)
    end

    it "throws error when dividing by zero" do
      calculator = Calculator.new
      expect {calculator.divide(10, 0)}.to raise_error(ZeroDivisionError)
    end

  end

  describe "multiply" do

    it "multiplies all provided arguments" do
      calculator = Calculator.new
      expect(calculator.multiply(1, 2, 3, 4)).to eql(24)
    end

    it "multiplies negative number correctly" do
      calculator = Calculator.new
      expect(calculator.multiply(-1, -2, 4)).to eql(8)
    end
  end

end