# This is our data structure
pool = ["A"] * 9 + ["B"] * 2 + ["C"] * 2 + ["D"] * 4 + ["E"] * 12 + ["F"] * 2 + ["G"] * 3 + ["H"] * 2 + ["I"] * 9 + ["J"] * 1 + ["K"] * 1 + ["L"] * 4 + ["M"] * 2 + ["N"] * 6 + ["O"] * 8 + ["P"] * 2 + ["Q"] * 1 + ["R"] * 6 + ["S"] * 4 + ["T"] * 6 + ["U"] * 4 + ["V"] * 2 + ["W"] * 2 + ["X"] * 1 + ["Y"] * 2 + ["Z"] * 1
# Saving the pool into an constant to avoid changes on the origianl
POOL = pool

# WAVE#1: Drawing a hand of 10 letters from the letter pool
def draw_letters
  letters_in_hand = POOL
  return letters_in_hand.sample(10)
end

# WAVE#2: Verifying user input is using the avaliable letters from the hand
def uses_available_letters?(input, letters_in_hand)
  hand_hash = letters_in_hand.uniq.map { |x| [x, letters_in_hand.count(x)] }.to_h
  input_array = input.upcase.split("")
  letter_check = []

  input_array.map do |letter|
    if hand_hash[letter].class == Integer
      if hand_hash[letter] >= 1
        hand_hash[letter] -= 1
        letter_check << "True"
      elsif hand_hash[letter] == 0
        letter_check << "False"
      end
    else
      letter_check << "False"
    end
  end

  puts letter_check.include?("False") ? false : true

end