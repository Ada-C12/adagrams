def draw_letters()
  letter_pool = ["A"] * 9 + ["B"] * 2 + ["C"] * 2 + ["D"] * 4 + ["E"] * 12 + ["F"] * 2 + ["G"] * 3 + ["H"] * 2 + ["I"] * 9 + ["J"] + ["K"] + ["L"] * 4 + ["M"] * 2 + ["N"] * 6 + ["O"] * 8 + ["P"] * 2 + ["Q"] + ["R"] * 6 + ["S"] * 4 + ["T"] * 6 + ["U"] * 4 + ["V"] * 2 + ["W"] * 2 + ["X"] + ["Y"] * 2 + ["Z"]
  hand = []
  
  10.times do
    letter_pool.shuffle!
    hand << letter_pool.pop
  end
  
  return hand
end

def uses_available_letters?(input, letters_in_hand)
  split = input.upcase.split("")
  
  split.each do |letter|
    if letters_in_hand.include? (letter)
      letters_in_hand.delete_at(letters_in_hand.index(letter))
    else
      return false
    end
  end
  
  return true
  
end
