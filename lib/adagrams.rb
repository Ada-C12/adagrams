# This is our data structure
pool = ["A"] * 9 + ["B"] * 2 + ["C"] * 2 + ["D"] * 4 + ["E"] * 12 + ["F"] * 2 + ["G"] * 3 + ["H"] * 2 + ["I"] * 9 + ["J"] * 1 + ["K"] * 1 + ["L"] * 4 + ["M"] * 2 + ["N"] * 6 + ["O"] * 8 + ["P"] * 2 + ["Q"] * 1 + ["R"] * 6 + ["S"] * 4 + ["T"] * 6 + ["U"] * 4 + ["V"] * 2 + ["W"] * 2 + ["X"] * 1 + ["Y"] * 2 + ["Z"] * 1
# Saving the origianl letter pool into an constant to avoid changes
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

  input_array.map do |letter|
    if hand_hash[letter].class == Integer && hand_hash[letter] > 0
      hand_hash[letter] -= 1
      return "True"
    else
      return "False"
    end
  end
end





# draw letters from current pool until pool is empty/not enough letters for next hand
# n = 1
# (current_pool.length/10).times do
#   hand_n = draw_letters(current_pool)
#   p hand_n
#   n += 1
# end