
class AbstractClass

  def template_method
    base_operation1
    required_operations1
    base_operation2
    hook1
    required_operations2
    base_operation3
    hook2
  end


  def base_operation1
    puts 'AbstractClass: I am doing the bulk of the work'
  end

  def base_operation2
    puts 'AbstractClass: But I let subclasses override some operations'
  end

  def base_operation3
    puts 'AbstractClass: But I am doing the bulk of the work anyway'
  end


  def required_operations1
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def required_operations2
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end


  def hook1; end

  def hook2; end
end

class ConcreteClass1 < AbstractClass
  def required_operations1
    puts 'ConcreteClass1: Implemented Operation1'
  end

  def required_operations2
    puts 'ConcreteClass1: Implemented Operation2'
  end
end

class ConcreteClass2 < AbstractClass
  def required_operations1
    puts 'ConcreteClass2: Implemented Operation1'
  end

  def required_operations2
    puts 'ConcreteClass2: Implemented Operation2'
  end

  def hook1
    puts 'ConcreteClass2: Overridden Hook1'
  end
end


def client_code(abstract_class)

  abstract_class.template_method

end

puts 'Same client code can work with different subclasses:'
client_code(ConcreteClass1.new)
puts "\n"

puts 'Same client code can work with different subclasses:'
client_code(ConcreteClass2.new)
