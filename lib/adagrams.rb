def draw_letters 
  letter_pool = ("a" * 10 + "b" * 2 + "c" * 2 + "d" * 4 + "e" * 12 + "f" * 2 + "g" * 3 + "h" * 2 + "i" * 9 + "j" + "k" + "l" * 4 + "m" * 2 + "n" * 6 + "o" * 8 + "p" * 2 + "q" + "r" * 6 + "s" * 4 + "t" * 6 + "u" * 4 + "v" * 2 + "w" * 2 + "x" + "y" * 2 + "z").chars
  letter_hand = []
  letter_hand = letter_pool.sample(10)
  return letter_hand
end 

def uses_available_letters?(input, letters_in_hand)
  input_array = input.chars 
  letters_copy = letters_in_hand.dup
  input_array.each do |letter|
    if letters_copy.include?(letter) 
      letters_copy.delete(letter)
    else 
      return false
    end
  end
  return true 
end 

def score_word(word)
  score_hash = {
    "AEIOULNRST" => 1,
    "DG" => 2,
    "BCMP" => 3,
    "FHVWY" => 4,
    "K" => 5,
    "JX" => 8,
    "QZ" => 10
  }
  
  score = 0
  word_array = word.chars
  word_array.each do |letter| 
    score_hash.each do |key, value|
      if key.include?(letter.upcase) 
        score += value
      end
    end 
  end 
  if word.length > 6
    score += 8
  end 
  return score 
end 

def highest_score_from(words)
# all words scores
  scores =  words.map do |word|
    score_word(word)
  end   

# words with max score
  max_score = scores.max 
  max_score_index = scores.each_index.select{|i| scores[i] == max_score}

  if max_score_index.count == 1
    winning_word = 
    {
      word: words[max_score_index[0]],
      score: max_score 
    }
    return winning_word
  else
    best_score_words = []
    best_score_words_length = []
    max_score_index.each do |i| 
      best_score_words << words[i]   
      best_score_words_length << words[i].length
    end  
    if best_score_words_length.include?(10) == false
        return shortest_word = best_score_words.min
      elsif best_score_words_length.include?(10) == true
          if best_score_words_length.uniq == best_score_words_length 
            return best_score_words 
          else   
            return best_score_words.index(best_score_words_length.index(10))
          end
      end 
  end
end
# In the case of tie in scores, use these tie-breaking rules:
# prefer the word with the fewest letters...
# ...unless one word has 10 letters. If the top score is tied between multiple words and one is 10 letters long, choose the one with 10 letters over the one with fewer tiles
# If the there are multiple words that are the same score and the same length, pick the first one in the supplied list 


#example = ["dog, "catherine"]
#scores = [5, 5]


