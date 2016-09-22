

    
      
    # iterative
  def iterative_a
    iterative_a_count = 0
    puts "Starting iterative_a"
    iterative_a_count = iterative_a_count + 1
    method_b_return = nil
    until method_b_return
      print "Send to b: "
      input = gets.strip
      method_b_return = iterative_b(input)
      puts "method_b returned"
    end
    puts "iterative_a finished w/ #{ iterative_a_count } invocations"
  end
     
    # recursive
  def recursive_a
    recursive_a_count = 0
    puts "Starting recursive_a"
    recursive_a_count = recursive_a_count + 1
    print "Send to b: "
    input = gets.strip
    recursive_b(input)
    puts "recursive_a finished w/ #{ recursive_a_count } invocations"
  end
     
  private
    def iterative_b(argument)
      puts "method_b executing"
      if argument == "stop"
        true
      else
        false
      end
    end
     
  def recursive_b(argument)
    puts "method_b executing"
    if argument == "stop"
      true
    else
      recursive_a
    end
  end

  iterative_a
  recursive_a

