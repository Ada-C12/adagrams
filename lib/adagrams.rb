require 'pry'

def return_letter_pool_hash
  
  letter_pool_hash = {
  "A" => {number_of_tiles: 9, number_of_points: 1},
  "B" => {number_of_tiles: 2, number_of_points: 3},
  "C" => {number_of_tiles: 2, number_of_points: 3},
  "D" => {number_of_tiles: 4, number_of_points: 2},
  "E" => {number_of_tiles: 12, number_of_points: 1},
  "F" => {number_of_tiles: 2, number_of_points: 4},
  "G" => {number_of_tiles: 3, number_of_points: 2},
  "H" => {number_of_tiles: 2, number_of_points: 4},
  "I" => {number_of_tiles: 9, number_of_points: 1},
  "J" => {number_of_tiles: 1, number_of_points: 8},
  "K" => {number_of_tiles: 1, number_of_points: 5},
  "L" => {number_of_tiles: 4, number_of_points: 1},
  "M" => {number_of_tiles: 2, number_of_points: 3},
  "N" => {number_of_tiles: 6, number_of_points: 1},
  "O" => {number_of_tiles: 8, number_of_points: 1},
  "P" => {number_of_tiles: 2, number_of_points: 3},
  "Q" => {number_of_tiles: 1, number_of_points: 10},
  "R" => {number_of_tiles: 6, number_of_points: 1},
  "S" => {number_of_tiles: 4, number_of_points: 1},
  "T" => {number_of_tiles: 6, number_of_points: 1},
  "U" => {number_of_tiles: 4, number_of_points: 1},
  "V" => {number_of_tiles: 2, number_of_points: 4},
  "W" => {number_of_tiles: 2, number_of_points: 4},
  "X" => {number_of_tiles: 1, number_of_points: 8},
  "Y" => {number_of_tiles: 2, number_of_points: 4},
  "Z" => {number_of_tiles: 1, number_of_points: 10}
}

return letter_pool_hash

end

def draw_letters
  
  letter_pool_hash = return_letter_pool_hash
  
  letter_pool_array = letter_pool_hash.map do |letter, letter_info|
    (letter * letter_info[:number_of_tiles]).split("")
  end
  
  letter_pool_array = letter_pool_array.flatten
  
  drawn_letters = letter_pool_array.sample(10)
  return drawn_letters
  
end

def uses_available_letters? (input, letters_in_hand)
  
  copy_of_hand = letters_in_hand.clone
  letters_of_input = input.upcase.split("")
  
  letters_of_input.each do |letter_from_input|
    if copy_of_hand.include? letter_from_input
      
      index_of_input_letter = copy_of_hand.index(letter_from_input)
      copy_of_hand.delete_at(index_of_input_letter)
      
    else
      
      copy_of_hand = letters_in_hand.clone
      return false
      
    end
  end
  
  return true
  
end

def score_word(word)
  
  letter_pool_hash = return_letter_pool_hash
  
  word_array = word.upcase.split("")
  
  word_points = word_array.map do |letter|
    letter_pool_hash[letter][:number_of_points]
  end
  
  if word_array.length >= 7 
    word_points << 8
  end
  
  return word_points.sum
  
end    

def highest_score_from(words)
  scores_hash = {} 
  
  words.each do |word|
    scores_hash[word] = score_word(word)
  end
  
  highest_score = scores_hash.values.max
  highest_scores_hash = scores_hash.select do |word, score|
    score == highest_score
  end
  
  if highest_scores_hash.length == 1
    return {word: highest_scores_hash.keys[0], score: highest_scores_hash.values[0]}
  else
    
    highest_scores_hash.each do |word, score|
      if word.length == 10
        return {word: word, score: score}
      end
    end
    
    min_length = highest_scores_hash.map { |word, score| word.length }.min
    highest_scores_hash.each do |word, score|
      if word.length == min_length
        return {word: word, score: score}
      end
    end
    
  end
end
