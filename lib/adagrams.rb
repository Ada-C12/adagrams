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
p letters_in_hand
print "Word please! "
input = gets.chomp.upcase

def uses_available_letters?(input, letters_in_hand)
  input = input.chars
  
  input.each do |letter|
    letters_in_hand
    if letters_in_hand.include?(letter)
      letters_in_hand.delete_at(letters_in_hand.index(letter))
    else
      return false
      break
    end
  end
  return true
end


puts uses_available_letters?(input, letters_in_hand)





