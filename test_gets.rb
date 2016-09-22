



# test_gets

Command Line $ ruby test_gets.rb 7

**********************************************

def setup(input_array)

  puts "in setup procedure"
  
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

# Main

input_array = ARGV
pole1, pole2, pole3, disks = setup(input_array)
result = input_move_and_validate(pole1, pole2, pole3, disks)
finish(result)
