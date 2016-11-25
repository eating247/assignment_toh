require 'pry'

class TowerOfHanoi
  def initialize height
    @height = height
    @linewidth = @height + 5
    @tower = (1..@height).to_a.reverse
    @columns = [ @tower, [], [] ]

    introduction
    render
    move
    render
    move
    render
    move
    render
    move
    render
    move
    render
    move
    render
    move
    render
    move




=begin    
until win
      render
      move
    end
=end
  end

  def introduction
    puts
    puts
    puts "======================================================="
    puts "Welcome to Tower of Hanoi!"
    puts "Rules:"
    puts "1. Only one disk can be moved at a time."
    puts "2. Each move consists of taking the upper disk from one of the stacks and placing it on top of another stack i.e. a disk can only be moved if it is the uppermost disk on a stack."
    puts "3. No disk may be placed on top of a smaller disk."
    puts
    puts "Press 'q' to exit the game anytime."
    puts "Hit enter when you're ready to start!"
    gets
    puts "======================================================="
    puts
    puts
  end

  def render
    (@height - 1).downto(0).each do |row|
      puts
      @columns.each do |column|
        if column[row] == nil
          print " " * @linewidth
        else
          print ("o" * column[row]).ljust(@linewidth)
        end
      end
    end
    puts
    puts "1".ljust(@linewidth) + "2".ljust(@linewidth) + "3".ljust(@linewidth)
  end

  def move
    puts "Enter move >"
    move = gets.chomp
    exit if move == "q"
    @source_column = move[0].to_i - 1
    @destination_column = move[2].to_i - 1
    register_move if check_move == true
  end

  def check_move
    @moving_disk = @columns[@source_column].last

    if (0..2).include?(@source_column) == false || (0..2).include?(@destination_column) == false
      puts "Please enter your answer in the format '1,3'."
      move
    else
      true
    end

    if @moving_disk.nil?
      puts "Not a valid move!"
      move
    elsif @columns[@destination_column].empty? == false && @moving_disk > @columns[@destination_column].last 
      puts "Not a valid move!"
      move
    else
      true
    end
  end

  def register_move
    @columns[@source_column].pop
    @columns[@destination_column] << @moving_disk

    puts "test check: columns"
    puts @columns[0].to_s
    puts @columns[1].to_s
    puts @columns[2].to_s
  end


  #end of class
end



game = TowerOfHanoi.new 3