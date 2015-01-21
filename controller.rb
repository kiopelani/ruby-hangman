require_relative "model.rb"

class Game
  def initialize
    @rounds_played = 0
    @rounds_won = 0
    @current_man = Man.new
  end

  def play
    while true
      game_status
      puts "Would you like to play a new round? Type 'yes' to play or 'no' to stop."
      case gets.chomp.downcase
        when 'yes'
          start_new_round
        when 'no'
          puts "Goodbye!"
          break
        else
          puts "That is not a valid command."
      end
    end
  end

  private
  def game_status
    puts "You have won #{@rounds_won} rounds and played #{@rounds_played} rounds."
  end

  def round_status
    puts "You have #{@current_man.body_parts_remaining} body parts remaining and the following letters left:"
    puts @current_man.display_letter_bank
  end

  def start_new_round
    @current_man = Man.new
    play_round
    @rounds_played += 1
    puts "GAME OVER!!"
  end

  def play_round
    while @current_man.still_alive
      @current_man.display_word
      round_status
      letter_guessed = guess_a_letter
      if @current_man.letter_is_in_word?(letter_guessed)
        @current_man.add_to_word(letter_guessed)
        if @current_man.word_complete?
          puts "YOU WIN"
          @rounds_won += 1
          break
        end
      else
        puts "Wrong guess!"
        @current_man.draw_body_part
        puts "You're DEAD!" if @current_man.still_alive == false
      end
      @current_man.remove_from_bank(letter_guessed)
    end
  end

  def guess_a_letter
    puts "Guess a letter"
    letter_guessed = gets.chomp
    until @current_man.letter_bank.include?(letter_guessed)
      puts "You can't guess that. Guess again."
      letter_guessed = gets.chomp
    end
    letter_guessed
  end
end