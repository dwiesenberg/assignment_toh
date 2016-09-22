# Tower of Hanoi Game - in Modules



def setup(input_array)

  puts "in setup procedure"

  puts "input_array = #{input_array}"
  puts "input_array[0] = #{input_array[0]}"
  
  puts "Enter the pole numbers from and to where you would like to move a disk in the format, e.g., '1,3'. Enter 'q' to quit."
  print "Input your response: "
  response = gets.chomp
  # response in format "1,3"  
  puts "response = #{response} (in input_move_and_validate)" 

  disks = input_array[0]     # Number of disks
  disks = disks.to_i
  if disks < 1 || disks > 7
    disks = 3          # default value
  end


  # Load first pole with disks. 
  # Array item value reflects size of disks: 
  # Disk 1 - largest .. Disk 2 - smaller, Disk 3 - smaller still, etc

  # pole1 pole2 pole3 hold the disks passed through ARGV on command line. 

  pole1 = []
  pole2 = []
  pole3 = []
  puts "pole1, pole2, pole3 = #{pole1}, #{pole2}, #{pole3}"
  
  (1..disks).each do |disk|
    pole1 << disk
  end
  
  puts "setup module"
  puts "pole disks arrays:"
  puts "pole1 = #{pole1}"
  puts "pole2 = #{pole2}"
  puts "pole3 = #{pole3}"
  puts "\n"


  puts "Welcome to Tower of Hanoi!"
  puts "Instructions: there are #{disks} disks."
  return pole1, pole2, pole3, disks

end


def input_move_and_validate(pole1, pole2, pole3, disks)
  puts "in input_move_and_validate procedure"
  error = true
  result = "make new move"

  while error == true || result == "make new move"
    error = false

    puts "input_move_and_validate module"
    puts "pole disks arrays:"
    puts "pole1 = #{pole1}"
    puts "pole2 = #{pole2}"
    puts "pole3 = #{pole3}"
    puts "\n"


    # input move
    puts "Enter the pole numbers from and to where you would like to move a disk in the format, e.g., '1,3'. Enter 'q' to quit."
    print "Input your response: "
    response = gets.chomp
    # response in format "1,3"  
    puts "response = #{response} (in input_move_and_validate)" 
    if response == "q"
      return response
    end

    # validate move
    puts "response[0] = #{response[0]} (in validate_move)"
    puts "response[1] = #{response[1]}"
    puts "response[2] = #{response[2]}"

    if response[1] != ","
      puts "Type comma between numbers. Re-input"
      error = true
      next
    end

    if not [1,2,3].include? response[0].to_i
      puts "Enter 1, 2 or 3 for poles. Re-input"
      error = true
      next
    end

    if not [1,2,3].include? response[2].to_i
      puts "Enter 1, 2 or 3 for poles. Re-input"
      error = true
      next
    end
    
    from_pole = []
    to_pole = []
    
    case response[0].to_i
    when 1
      from_pole = pole1
    when 2
      from_pole = pole2
    when 3
      from_pole = pole3
    end

    case response[2].to_i
    when 1
      to_pole = pole1
    when 2
      to_pole = pole2
    when 3
      to_pole = pole3
    end

    puts "from_pole = #{from_pole}"
    puts "to_pole = #{to_pole}"

    # after move is upper disk smaller than next disk under?"

    puts "after move - is upper disk smaller than next disk under?"
    puts "pole disks arrays:"
    puts "pole1 = #{pole1}"
    puts "pole2 = #{pole2}"
    puts "pole3 = #{pole3}"
    puts "\n"

    puts "from_pole = #{from_pole}"
    if from_pole[-1] == nil
      puts "You are moving from a pole with no disks! Input move again"
      error = true
      next
    end  

    puts "On Line 134"
    puts "to_pole = #{to_pole}"
    puts "from_pole[-1] = #{from_pole[-1]}"
    puts "to_pole[-1] = #{to_pole[-1]}"
    
    if to_pole[-1] != nil  
      puts "On Line 139"
      if from_pole[-1] < to_pole[-1]
              puts "On Line 141"
        # is disk about to be moved smaller than top disk in pole it is to be moved to?
        print "Top disk must be smaller than one underneath. Re-input"
        error = true
        next
      end
      puts "On Line 46"
    end
    sleep(5)


    # move disks
    puts "before disk transfer"
    puts "pole disks arrays:"
    puts "pole1 = #{pole1}"
    puts "pole2 = #{pole2}"
    puts "pole3 = #{pole3}"
    puts "\n"

    to_pole.push(from_pole[-1])  
       # place value of top disk on "from pole" on top of "to pole"   
    from_pole.pop  # remove top disk on "from pole"

    puts "after disk transfer"
    puts "pole disks arrays:"
    puts "pole1 = #{pole1}"
    puts "pole2 = #{pole2}"
    puts "pole3 = #{pole3}"
    puts "\n"

    if pole1.length == disks || pole2.length == disks || pole3.length == disks
      result = "win"
      puts result
      return result
    else
      puts "Make new move"
      result = "make new move"
    end  
  end

end



def finish(result)
  puts "in finish procedure"
  case result
  when "q"
    puts "Game terminated"
  when "win"
    puts "Congratulations! You have won the game"
  else
    puts "result = #{result}"
    puts "Unexpected event - investigate"
  end
  puts "Goodbye!"
end


# Main 
                       ###### REFACTOR AFTER CODING
input_array = ARGV
pole1, pole2, pole3, disks = setup(input_array)
result = input_move_and_validate(pole1, pole2, pole3, disks)
finish(result)


# End





























