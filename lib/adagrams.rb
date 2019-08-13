def draw_letters
  
  letter_pool_hash = {
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
  
  letter_pool_array = letter_pool_hash.map do |letter, amount|
    (letter * amount).split("")
  end
  
  letter_pool_array = letter_pool_array.flatten
  
  letters = letter_pool_array.sample(10)
  return letters
  
end

def uses_available_letters? (input, letters_in_hand)
  
  copy_of_hand = letters_in_hand.clone
  letters_of_input = input.upcase.split("")
  
  letters_of_input.each do |letter_from_input|
    if copy_of_hand.include? letter_from_input
      index_of_input_letter = copy_of_hand.index(letter_from_input)
      copy_of_hand.delete_at(index_of_input_letter)
      puts "Letters in hand: #{letters_in_hand}"
      puts "Copy of hand: #{copy_of_hand}."
    else
      puts "False"
      puts "Letters in hand: #{letters_in_hand}."
      copy_of_hand = letters_in_hand.clone
      return false
    end
  end
  
  puts "True"
  return true
  
end