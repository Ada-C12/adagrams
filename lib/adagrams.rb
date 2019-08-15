require "csv"

def draw_letters 
  letter_pool = ("a" * 10 + "b" * 2 + "c" * 2 + "d" * 4 + "e" * 12 + "f" * 2 + "g" * 3 + "h" * 2 + "i" * 9 + "j" + "k" + "l" * 4 + "m" * 2 + "n" * 6 + "o" * 8 + "p" * 2 + "q" + "r" * 6 + "s" * 4 + "t" * 6 + "u" * 4 + "v" * 2 + "w" * 2 + "x" + "y" * 2 + "z").chars
  letter_hand = letter_pool.sample(10)
  return letter_hand
end 

def uses_available_letters?(input, letters_in_hand)
  letters_copy = letters_in_hand.dup
  input.chars.each do |letter|
    if letters_copy.include?(letter) 
      letters_copy.delete_at(letters_copy.index(letter))
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
  word.chars.each do |letter| 
    score_hash.each do |letters_string, points|
      if letters_string.include?(letter.upcase) 
        score += points
      end
    end 
  end 
  if word.length > 6
    score += 8
  end 
  return score 
end 

def highest_score_from(words)
  scores =  words.map do |word|
    score_word(word)
  end   

  max_score = scores.max 
  max_score_indices = scores.each_index.select{|i| scores[i] == max_score}

  if max_score_indices.count == 1
    winning_word = 
    {
      word: words[max_score_indices[0]],
      score: max_score 
    }
    return winning_word
  else
    best_score_words = []
    best_score_words_length = []
    max_score_indices.each do |i| 
      best_score_words << words[i]   
      best_score_words_length << words[i].length
    end
    if best_score_words_length.include?(10)  
      winning_index = best_score_words_length.index(10)
      return winning_word = 
      {
      word: best_score_words[winning_index],
      score: max_score
      } 
    else 
      return winning_word = 
      { 
        word: best_score_words.min { |a, b| a.length <=> b.length },
        score: max_score
      } 
    end 
  end
end

def is_in_english_dict?(user_input_word)
  CSV.foreach("/Users/dnsanche/adagrams/assets/dictionary-english.csv") do |row|
    if row[0].to_s == user_input_word
      return true
    end
  end
  return false
end


