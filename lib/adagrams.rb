# Wave 1
def draw_letters
  
  all_tiles = { 
    A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9,  J: 1, K: 1, L: 4, M: 2, 
    N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1 
  }
  
  tile_array = []
  
  all_tiles.each do |letter, number|
    number.times do 
      tile_array.push(letter.to_s)
    end
  end
  
  user_hand = tile_array.sample(10)
  return user_hand    
end

# Wave 2
def uses_available_letters?(input, letters_in_hand)
  user_string = input.upcase
  letters_to_check = letters_in_hand.dup
  user_string.length.times do |num|
    tile_position = letters_to_check.index(user_string[num])
    if !tile_position
      return false
    else
      letters_to_check.delete_at(tile_position)
    end
  end
  return true
end

# Wave 3
def score_word(word)
  
  score_hash = {
    A: 1, E: 1, I: 1, O: 1, U: 1, L: 1, N: 1, R: 1, S: 1, T: 1,
    D: 2, G: 2,
    B: 3, C: 3, M: 3, P: 3,
    F: 4, H: 4, V: 4, W: 4, Y: 4,
    K: 5,
    J: 8, X: 8,
    Q: 10, Z:10
  }
  
  score_total = 0
  
  word.length.times do |i|
    letter = word[i].upcase
    score_total += score_hash[letter.to_sym]
  end
  
  if word.length >= 7 && word.length <= 10
    score_total += 8
  end
  
  return score_total
end

# Wave 4
def highest_score_from(words)
  
  words_and_scores = []
  words.each do |word|
    words_and_scores.push({word: word, score: score_word(word)})
  end
  
  # find highest score
  max_score = 0
  words_and_scores.each do |hash| 
    if hash[:score] > max_score
      max_score = hash[:score]
    end
  end
  
  highest_words = []
  words_and_scores.each do |hash|
    if hash[:score] == max_score
      highest_words.push(hash)
    end
  end
  
  # return highest scoring word
  if highest_words.length == 1
    winner = highest_words[0]
    return winner
  else
    # return word of ten characters
    highest_words.each do |hash|
      if hash[:word].length == 10
        return hash
      end
    end
    
    # return first shortest word
    min_length = 10
    min_words = []
    highest_words.each do |hash|
      if hash[:word].length < min_length
        min_length = hash[:word].length
      end
    end
    
    highest_words.each do |hash|
      if hash[:word].length == min_length
        min_words.push(hash)
      end
    end
    
    return min_words[0]
  end
  
  return highest_words
  
end
