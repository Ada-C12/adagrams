# This is our data structure
pool = ["A"] * 9 + ["B"] * 2 + ["C"] * 2 + ["D"] * 4 + ["E"] * 12 + ["F"] * 2 + ["G"] * 3 + ["H"] * 2 + ["I"] * 9 + ["J"] * 1 + ["K"] * 1 + ["L"] * 4 + ["M"] * 2 + ["N"] * 6 + ["O"] * 8 + ["P"] * 2 + ["Q"] * 1 + ["R"] * 6 + ["S"] * 4 + ["T"] * 6 + ["U"] * 4 + ["V"] * 2 + ["W"] * 2 + ["X"] * 1 + ["Y"] * 2 + ["Z"] * 1
POOL = pool

# WAVE#1
def draw_letters
  letters_in_hand = POOL
  return letters_in_hand.sample(10)
end

# WAVE#2:
def uses_available_letters?(word, letters_in_hand)
  hand_hash = letters_in_hand.uniq.map { |x| [x, letters_in_hand.count(x)] }.to_h
  word_array = word.upcase.split("")
  letter_check = []

  word_array.map do |letter|
    if hand_hash[letter].class == Integer
      if hand_hash[letter] >= 1
        hand_hash[letter] -= 1
        letter_check << "True"
      elsif hand_hash[letter] == 0
        letter_check << "False"
      end
    else
      letter_check << "False"
    end
  end
  return letter_check.include?("False") ? false : true
end

# WAVE#3
def score_word(word)
  score_chart = {
    "A" => 1,
    "E" => 1,
    "I" => 1,
    "O" => 1,
    "U" => 1,
    "L" => 1,
    "N" => 1,
    "R" => 1,
    "S" => 1,
    "T" => 1,
    "D" => 2,
    "G" => 2,
    "B" => 3,
    "C" => 3,
    "M" => 3,
    "P" => 3,
    "F" => 4,
    "H" => 4,
    "V" => 4,
    "W" => 4,
    "Y" => 4,
    "K" => 5,
    "J" => 8,
    "X" => 8,
    "Q" => 10,
    "Z" => 10
  }
  score = 0
  word_array = word.upcase.split("")
  print word_array
  
  word_array.map do |letter|
    score += score_chart[letter]
  end

  if word_array.length == 7 || word_array.length == 8 || word_array.length == 9 || word_array.length == 10
    score += 8
  end

  return score
end

# WAVE#4
def highest_score_from(words)
  scores = words.map do |word|
    score_word(word)
  end
  highest_score = scores.max
  p scores

  winner = nil
  words_with_scores = words.zip(scores)
  winning_words_with_scores = words_with_scores.select {| word, score | score == highest_score }
  winning_words = winning_words_with_scores.map {| word, score| word }

  winning_words.each do |word|
    if word.length == 10
      winner = word
      return {word: winner, score: highest_score}
    else 
      winner = winning_words.min {|x,y| x.size <=> y.size}
    end
  end
  return {word: winner, score: highest_score}
end