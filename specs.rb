require_relative 'model.rb'

describe "Man.new" do
  let(:man){ Man.new }

  it "@letter_bank is equal to an array of the alphabet" do
    expect(man.letter_bank).to eq(("a".."z").to_a)
  end

  it "@word is equal to an array of equal length to @word_to_guess" do
    expect(man.word.length).to eq(man.word_to_guess.length)
  end
end

describe "Man.still_alive" do
  let(:man){ Man.new }
  let(:deadman){ Man.new}

  it "Returns true when man has more than 0 parts remaining" do
    expect(man.still_alive).to be(true)
  end
  it "Returns false when man has no parts remaining" do
    deadman.body_parts_remaining = 0
    expect(deadman.still_alive).to be(false)
  end
end
