class Player

  attr_accessor :name, :lives

  def initialize(name)
    @lives = 3
    @name = name
  end

  def get_name
    puts "What's your name?"
    @name = gets.chomp
    print "Hey #{name}! Let's get started!\n"
  end

end