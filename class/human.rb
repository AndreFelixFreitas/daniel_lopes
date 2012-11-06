# encoding: utf-8
class Human

  attr_accessor :first_name, :last_name, :age

  def initialize(first_name, last_name, age)
    @first_name = first_name
    @last_name  = last_name
    @age        = age
  end

  def full_name
    [first_name, last_name].join(" ")
  end

end

andre = Human.new("andre", "felix", 23)
p andre.full_name
andre.first_name = "André"
andre.last_name = "Félix"
andre.age = 23
p andre.full_name