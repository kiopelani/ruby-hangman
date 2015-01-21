module Draw
  def self.welcome
    puts "*        *                      *        *"
    puts " *      *                        *      *"
    puts "  *    *                          *    *"
    puts "   *  *                            *  *"
    puts "    **      WELCOME TO HANGMAN      **"
    puts "   *  *                            *  *   "
    puts "  *    *                          *    *"
    puts " *      *                        *      *"
    puts "*        *                      *        *"
  end

  def self.gameboard(man)
    Draw.man(man.body_parts_remaining)
    Draw.word(man.word)
    Draw.letter_bank(man.letter_bank)
  end

  def self.letter_bank(letters)
    puts "|-------LETTERS REMAINING--------|"
    puts '*' * 33
    puts "**  " + letters[0..(letters.length/ 2)-1].join(" ") + "  **"
    puts "**  " + letters[(letters.length / 2)..-1].join(" ") + "  **"
    puts '*' * 33
  end

  def self.word(current_word)
    puts
    puts "WORD: " + current_word.join("|")
    puts
  end

  def self.deadman
    puts "________"
    puts "|   |"
    puts "|   _"
    puts "| _| |_"
    puts "| (X_X)"
    puts "| -( )-"
    puts "|  / \\"
    puts "|"
    puts "_______________"
    puts "OH NO!! YOU'RE DEAD!!"
    puts "*        *"
    puts " *      *"
    puts "  *    *"
    puts "   *  *"
    puts "    **"
    puts "   *  *"
    puts "  *    *"
    puts " *      *"
    puts "*        *"
  end

  def self.saved
    puts "________"
    puts "|   "
    puts "|"
    puts "|   _"
    puts "| _| |_"
    puts "| (^_^)"
    puts "| -( )-"
    puts "|  / \\"
    puts "_______________"
    puts "HOORAY! NO HANGING TODAY!"
  end

  private
   def self.man(num_of_parts)
    case num_of_parts
    when 7
      self.empty_gallows
    when 6
      hat
    when 5
      head
    when 4
      body
    when 3
      left_arm
    when 2
      right_arm
    when 1
      left_leg
    when 0
      dead_man
    else
      puts "ERROR"
    end
  end

  def self.empty_gallows
    puts "_______"
    puts "|   |"
    puts "|   O"
    puts "| "
    puts "| "
    puts "| "
    puts "|  "
    puts "|"
    puts "_______________"
  end

  def self.hat
    puts "________"
    puts "|   |"
    puts "|   _"
    puts "| _| |_"
    puts "| "
    puts "| "
    puts "| "
    puts "|"
    puts "_______________"
  end

  def self.head
    puts "________"
    puts "|   |"
    puts "|   _"
    puts "| _| |_"
    puts "| (-_-)"
    puts "| "
    puts "| "
    puts "|"
    puts "_______________"
  end

  def self.body
    puts "________"
    puts "|   |"
    puts "|   _"
    puts "| _| |_"
    puts "| (-_-)"
    puts "|  ( )"
    puts "|  "
    puts "|"
    puts "_______________"
  end

  def self.left_arm
    puts "________"
    puts "|   |"
    puts "|   _"
    puts "| _| |_"
    puts "| (-_-)"
    puts "| -( )"
    puts "|  "
    puts "|"
    puts "_______________"
  end

  def self.right_arm
    puts "________"
    puts "|   |"
    puts "|   _"
    puts "| _| |_"
    puts "| (-_-)"
    puts "| -( )-"
    puts "|  "
    puts "|"
    puts "_______________"
  end

  def self.left_leg
    puts "________"
    puts "|   |"
    puts "|   _"
    puts "| _| |_"
    puts "| (-_-)"
    puts "| -( )-"
    puts "|  / "
    puts "|"
    puts "_______________"
  end

end