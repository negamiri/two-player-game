require_relative 'players'

class Game

  attr_accessor :player1, :player2

  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
    @turn = 1
    @current_player = ''

    @rand_num1 = 0
    @rand_num2 = 0
    @user_answer = nil
    @correct_answer = 0
  end

  def player_turn
    @current_player = player2 if @turn.even?
    @current_player = player1 if @turn.odd?
  end

  def game_question
    @rand_num1 = rand(1..20).to_i
    @rand_num2 = rand(1..20).to_i
    puts "#{@current_player.name}: What's #{@rand_num1} plus #{@rand_num2}?"
    @user_answer = gets.chomp.to_i
  end

  def find_answer
      @correct_answer = @rand_num1 + @rand_num2
  end

  def check_answer
    if @user_answer == @correct_answer
      puts "Bingo! You've got it!"
    else
      puts "Noooooope."
      player1.lives = player1.lives - 1 if @current_player.name == player1.name
      player2.lives = player2.lives - 1 if @current_player.name == player2.name
    end
  end

  def print_score
    print "#{player1.name}: #{player1.lives}, #{player2.name}: #{player2.lives} \n"
  end

  def end_game
    puts player1.lives == 0 ? "#{player1.name}, you're all out of lives! you lose!" : "#{player2.name}, you're all out of lives! you lose!"
  end

  def game_loop
    while player1.lives > 0 && player2.lives > 0 do
      player_turn
      game_question
      find_answer
      check_answer
      print_score
      @turn += 1
      puts "---------New turn---------"
    end
    end_game
  end

end

player1 = Player.new("player 1")
player2 = Player.new("player 2")
player1.get_name
player2.get_name

new_game = Game.new(player1, player2)
new_game.game_loop

