require_relative "model.rb"
require_relative "view.rb"
require_relative "utils.rb"

class Game
  def initialize
    @rounds_played = 0
    @rounds_won = 0
    @playing = true
    @current_man = Man.new
  end

  def play
    refresh_screen!
    Draw.welcome
    while @playing
      game_status
      new_round?
    end
    puts "GOODBYE!!"
  end

  private

  def game_status
    puts
    puts "You have won #{@rounds_won} rounds and played #{@rounds_played} rounds."
  end

  def new_round?
    puts "Would you like to play a new round? Type 'yes' to play or 'no' to stop."
    case gets.chomp.downcase
    when 'yes'
      start_new_round
    when 'no'
      @playing = false
    else
      puts "That is not a valid command."
    end
  end

  def start_new_round
    @current_man = Man.new
    play_round
    @rounds_played += 1
  end

  def play_round
    while @current_man.still_alive
      refresh_screen!
      Draw.gameboard(@current_man)
      letter = get_letter_guess
      @current_man.check_letter(letter)
      if @current_man.word_complete?
        refresh_screen!
        Draw.saved
        @rounds_won += 1
        break
      elsif @current_man.still_alive == false
        refresh_screen!
        Draw.deadman
        @current_man.reveal_word
      end
    end
  end

  def get_letter_guess
    puts "Guess a letter"
    letter_guessed = gets.chomp
    until @current_man.letter_bank.include?(letter_guessed)
      puts "Please guess one of the remaining letters only."
      letter_guessed = gets.chomp
    end
    letter_guessed
  end
end

