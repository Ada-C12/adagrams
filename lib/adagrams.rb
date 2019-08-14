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

def score_word(user_input)
  # points = {
  #   1 => %w(A E I O U L N R S T),
  #   2 => %w(D G),
  #   3 => %w(B C M P),
  #   4 => %w(F H V W Y),
  #   5 => %w(K),
  #   8 => %w(J X),
  #   10 => %w(Q Z)
  # }
points = {
    "A" => 1,
    "B" => 3,
    "C" => 3,
    "D" => 2,
    "E" => 1,
    "F" => 4,
    "G" => 2,
    "H" => 4,
    "I" => 1,
    "J" => 8,
    "K" => 5,
    "L" => 1,
    "M" => 3,
    "N" => 1,
    "O" => 1,
    "P" => 3,
    "Q" => 10,
    "R" => 1,
    "S" => 1,
    "T" => 1,
    "U" => 1,
    "V" => 4,
    "W" => 4,
    "X" => 8,
    "Y" => 4,
    "Z" => 10
}

  input_array = user_input.chars
  total_points = input_array.map do |letter|
    points[letter]
  end
  return total_points.sum
end
#     if points.values.include?(points[letter])
#       puts "hello"
#       #total_points << points.key(letter)
#     end
#   end
# end

puts score_word("MOUSE")



#puts uses_available_letters?(input, letters_in_hand)

# wave three-- use hash of arrays. point = key, letters = values in an array
# points_hash {
#   [1 =>
#     ["A",...]
# }





