def draw_letters
  all_letters_hash = {
    "A" => 9,
    "B" => 2,
    "C" => 2,
    "D" => 4,
    "E" => 12,
    "F" => 2,
    "G" => 3,
    "H" => 2,
    "I" => 9,
    "J" => 1,
    "K" => 1,
    "L" => 4,
    "M" => 2,
    "N" => 6,
    "O" => 8,
    "P" => 2,
    "Q" => 1,
    "R" => 6,
    "S" => 4,
    "T" => 6,
    "U" => 4,
    "V" => 2,
    "W" => 2,
    "X" => 1,
    "Y" => 2,
    "Z" => 1
  }
  all_letters_array = Array.new
  all_letters_hash.each do |letter, number|
    number.times do
      all_letters_array << letter
    end
  end

  letters_in_hand = all_letters_array.sample(10)

end

letters_in_hand = draw_letters

def uses_available_letters?(input, letters_in_hand)
  input = input.chars
  # Make new Hash to store letters and occurence
  letter_count = Hash.new(0)
  letters_in_hand.each do |letter|
    letter_count[letter] += 1
  end
  input.each do |letter|
    if letters_in_hand.include?(letter)
      letter_count[letter] -= 1
      if letter_count[letter] < 0
        return false
        break
      end
    else
      return false
      break
    end
  end
  return true
end
#   new_array = []

#   input.each do |letter|
#     if letters_in_hand.include?(letter)
#     letters_in_hand.delete_at(letters_in_hand.index(letter))
#     new_array << letter
#     else
#       return false
#       break
#     end
#   end
#   letters_in_hand = new_array + letters_in_hand
#     p new_array
#     p letters_in_hand
#     return true
# end



# We can't alter the hand.
# Make a new array, move each matching letter into it, move rest into it, have letters_in_hand point to that array after input has been iterated through
# y << x.delete('b')

# OR put letters_in_hand into hash w/ occurrence as value with += 1
# each iteration if matches hash["A"] -= 1
# if <0 return false

#puts uses_available_letters?(input, letters_in_hand)

# wave three-- use hash of arrays. point = key, letters = values in an array
# points_hash {
#   [1 =>
#     ["A",...]
# }





