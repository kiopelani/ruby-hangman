require_relative "word_bank.rb"

class Man
  attr_reader :letter_bank, :body_parts_remaining, :word

  def initialize
    @word_to_guess = Word.get_new
    @letter_bank = ("a".."z").to_a
    @word = Array.new(@word_to_guess.length, "_")
    @body_parts_remaining = 7
  end

  def still_alive
    @body_parts_remaining > 0
  end

  def word_complete?
    @word.include?("_") == false
  end

  def check_letter(letter)
    letter_is_in_word?(letter) ? add_to_word(letter) : add_body_part
    remove_from_bank(letter)
  end

  def reveal_word
    puts "The correct word was #{@word_to_guess.join("").upcase}"
  end

  private

  def letter_is_in_word?(letter)
    @word_to_guess.include?(letter.downcase)
  end

  def add_to_word(letter)
    @word_to_guess.each_with_index { |curr_letter, i| @word[i] = letter if curr_letter == letter }
  end

  def add_body_part
    @body_parts_remaining -= 1
  end

  def remove_from_bank(letter)
    i = @letter_bank.index(letter)
    @letter_bank[i] = "*"
  end

end