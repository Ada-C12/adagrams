
# Wave 1

def draw_letters
  quantity_by_letter = {
  A: 9,
  B: 2,
  C: 2,
  D: 4,
  E: 12,
  F: 2,
  G: 3,
  H: 2,
  I: 9,
  J: 1,
  K: 1,
  L: 4,
  M: 2,
  N: 6,
  O: 8,
  P: 2,
  Q: 1,
  R: 6,
  S: 4,
  T: 6,
  U: 4,
  V: 2,
  W: 2,
  X: 1,
  Y: 2,
  Z: 1
}

array_letters = quantity_by_letter.map do |letter, quantity|
  letter.to_s * quantity
end

array_letters = array_letters.join("")
array_letters = array_letters.split('')

array_hand = array_letters.sample(10)

return array_hand

end

# Wave 2

def uses_available_letters?(user_input_word, letters_in_hand)
  user_input_array = user_input_word.upcase.split("")
  
  validator = 0
  
  user_input_array.each do |character|
    if letters_in_hand.include?(character)
      letters_in_hand.delete_at(letters_in_hand.index(character))
    elsif
      validator += 1
      break
    end 
    
  end
  
  return validator == 0
  
end

# Wave 3
def score_word(word)
  values_by_letter = {
  A: 1,
  B: 3,
  C: 3,
  D: 2,
  E: 1,
  F: 4,
  G: 2,
  H: 4,
  I: 1,
  J: 8,
  K: 5,
  L: 1,
  M: 3,
  N: 1,
  O: 1,
  P: 3,
  Q: 10,
  R: 1,
  S: 1,
  T: 1,
  U: 1,
  V: 4,
  W: 4,
  X: 8,
  Y: 4,
  Z: 10
}

word = word.upcase.split("")

total = 0

word.each do |character|
  total += values_by_letter[character.to_sym]
end

if word.length >= 7
  total += 8
else
  total
end

return total

end
