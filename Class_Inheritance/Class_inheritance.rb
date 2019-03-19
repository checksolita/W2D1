class Employee
  attr_reader :salary, :name, :boss
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
    boss.employees << self if !boss.nil?
  end

  def bonus(multiplier)
    bonus = (@salary) * multiplier
  end

  def inspect
    "<Employee: Name = #{@name}, Boss = #{@boss.name}>"
  end

end

class Manager < Employee
  attr_reader :employees
  def initialize(name, title, salary, boss)
    super
    @employees = []
    boss.employees << self if !boss.nil?
  end

  def bonus(multiplier)
    sum = 0

    @employees.each do |employee|
      sum += employee.salary
    end

    sum * multiplier
  end

  def inspect
    "<Manager: Name = #{@name}, Employees = #{@employees.inspect}>"
  end

end

if __FILE__ == $0

  al = Manager.new("Al", "SUPER FOUNDER", 1000000000000, nil)

  ned = Manager.new("Ned", "Founder", 1000000, al)
  darren = Manager.new("Darren", "TA Manager", 78000, ned)
  shawna = Employee.new("shawna", "TA", 12000, darren)
  david = Employee.new("David", "TA", 10000, darren)
end