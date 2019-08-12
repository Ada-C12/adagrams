def draw_letters
  letters_in_hand = ARRAY_OF_LETTERS.shuffle.pop(10)
  return letters_in_hand
end


ARRAY_OF_LETTERS = ["A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B", "C", "C", "D", "D", "D", "D", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "F", "F", "G", "G", "G", "H", "H", "I", "I", "I", "I", "I", "I", "I", "I", "I", "J", "K", "L", "L", "L", "L", "M", "M", "N", "N", "N", "N", "N", "N", "O", "O", "O", "O", "O", "O", "O", "O", "P", "P", "Q", "R", "R", "R", "R", "R", "R", "S", "S", "S", "S", "T", "T", "T", "T", "T", "T", "U", "U", "U", "U", "V", "V", "W", "W", "X", "Y", "Y", "Z"]



def uses_available_letters? (input, letters_in_hand)
  input = input.upcase.chars
  #p input
  check = 0
  input.each do |chars|
    if letters_in_hand.include?(chars)
      letters_in_hand.delete(chars)
    else
      check += 1
    end
    return check == 0
  end
end
