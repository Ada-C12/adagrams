# wave1 code
def draw_letters
  pool_of_letters = {
    "A" => 9, "B" => 2, "C" => 2, "D" => 4, "E" => 12, "F" => 2, "G" => 3, "H" => 2, "I" => 9, "J" => 1, "K" => 1, "L" => 4, "M" => 2, "N" => 6, "O" => 8, "P" => 2, "Q" => 1, "R" => 6, "S" => 4, "T" => 6, "U" => 4, "V" => 2, "W" =>2, "X" => 1, "Y" => 2, "Z" => 1
  }
  
  players_letters = []
  alphabet = ("A".."Z").to_a
  
  until players_letters.length == 10
    random_letter = alphabet.sample
    if pool_of_letters[random_letter] && pool_of_letters[random_letter] > 0
      players_letters << random_letter
      pool_of_letters[random_letter] -= 1
    end
  end
  
  return players_letters
end

#player_one_letters = draw_letters
#p player_one_letters

# wave2 code

#print "Create a word using your pile letters: >"
#input = gets.chomp.upcase

def uses_available_letters?(input, letters_in_hand)
  user_word = input.upcase.chars
  word_hash = {}
  user_word.each do |letter|
    if word_hash["#{letter}"].nil?
      word_hash["#{letter}"] = 1
    else
      word_hash["#{letter}"] += 1
    end
  end
  
  #p word_hash

  full_pile = {}
  letters_in_hand.each do |letter|
    if full_pile["#{letter}"].nil?
      full_pile["#{letter}"] = 1
    else
      full_pile["#{letter}"] += 1
    end
  end 
   
   #p full_pile

  return word_hash.all? do |letter, count|
    full_pile.has_key?(letter) && (full_pile[letter] >= word_hash[letter])
  end

#p full_pile
end