# Tower of Hanoi Game - in Modules



def setup(input_array)
  disks = input_array[0]     # Number of disks
  disks = disks.to_i
  if disks < 1 || disks > 7
    disks = 3          # default value
  end

  # Load first pole with disks. 
  # Array item value reflects size of disks: 
  # Disk 1 - largest .. Disk 2 - smaller, Disk 3 - smaller still, etc

  pole_disks = []
  (1..disks).each do |disk|
    pole_disks << [1, disk]
  end
  
  puts "pole_disks array:"
  puts pole_disks    # testing
  puts "\n"

  puts "Welcome to Tower of Hanoi!"
  puts "Instructions: there are #{disks} disks."

  move_disk    # go to next module

end


def move_disk
  puts "Enter the pole numbers from and to where you would like to move a disk in the format, e.g., '1,3'. Enter 'q' to quit."
  print "Input your response: "
  response = gets.chomp
  # response = "1,3"
  
  puts "response = #{response} (in move_disk)" 
  validate_move(response)
end


def validate_move(response)
  pole_disks = []
  puts "response[0] = #{response[0]} (in validate_move)"
  puts "response[1] = #{response[1]}"
  puts "response[2] = #{response[2]}"
  p response
  from_pole = response[0].to_i
  to_pole = response[2].to_i
  if response == "q"
    finish(response)
  end
  if response[1] != ","
    puts "Type comma between numbers. Re-input"
    move_disk
  end
  if not [1,2,3].include? from_pole
    puts "Enter 1, 2 or 3 for poles. Re-input"
    move_disk
  end
  if not [1,2,3].include? to_pole
    puts "Enter 1, 2 or 3 for poles. Re-input"
    move_disk
  end


  if pole_disks[from_pole,-1] > pole_disks[to_pole,-1]  
       # is disk about to be moved smaller than top disk in pole it is to be moved to?
    print "Top disk must be smaller than one underneath. Re-input"
    move_disk
  end

  # move disks
  puts "before move - from_pole (pole #{from_pole}): top disk size = #{pole_disks[from_pole,-1]}"       # test
  puts "before move - to_pole (pole #{from_pole}): top disk size = #{pole_disks[to_pole,-1]}"       # test
  pole_disks[to_pole].push(pole_disks[from_pole,-1])  
     # place value of top disk on "from pole" on top of "to pole"   
  pole_disks[from_pole].pop   # remove top disk on "from pole"
  puts "after move - from_pole (pole #{from_pole}): top disk size = #{pole_disks[from_pole,-1]}"       # test
  puts "after move - to_pole (pole #{from_pole}): top disk size = #{pole_disks[to_pole,-1]}"       # test

  puts "Status of disks"
  poles.each do |pole|
    print "\n"
    puts "pole #{pole}: "
    disks.each do |disk|
      print "#{pole_disks[pole,disk]}, "   # check this over
    end
  end
  analyze_result(pole_disks)
end


def analyze_results(pole_disks)
  (1..3).each do |pole|
    if pole_disks[pole].length == disks
      result = "win"
    else
      result = "new move"
    end
    puts "analyze_results - pole #{pole} has #{pole_disks[pole].length} disks."    # test
    puts "total disks = #{disks}. result = #{result}"     # test
  end
  finish(result)
end


def finish(result)
  case result
  when "q"
    puts "Game terminated"
  when "new move"
    puts "Make another move"
    move_disk
  when "win"
    puts "Congratulations! You have won the game"
  else
    puts "Unexpected event - investigate"
  end
  puts "Goodbye!"
end


# Main 
                       ###### REFACTOR AFTER CODING
input_array = ARGV
setup(input_array)
move_disk
finish

# End





























