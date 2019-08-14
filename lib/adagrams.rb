LETTER_POOL = { A: 9, N: 6, B: 2, O: 8, C: 2, P: 2, D: 4, Q: 1, E: 12, 
                R: 6, F: 2, S: 4, G: 3, T: 6, H: 2, U: 4, I: 9, V: 2, 
                J: 1, W: 2, K: 1, X: 1, L: 4, Y: 2, M: 2, Z: 1 }

def draw_letters 
  letters = LETTER_POOL.map do |letter, count|
    Array.new(count, letter.to_s)
  end
  
  return letters.flatten.sample(10)
end

def uses_available_letters?(input, letters_in_hand)
  letters = letters_in_hand.clone

  input.upcase.each_char do |c|
    index = letters.find_index(c)

    if index.nil?
      return false
    else
      letters.delete_at(index)
    end 
  end

  return true
end

scores = [
  {
    letters: %w(A E I O U L N R S T),
    value: 1
  },
  { 
    letters: %w(D G),
    value: 2
  },
  {
    letters: %w(B C M P),
    value: 3
  },
  {
    letters: %w(F H V W Y),
    value: 4
  },
  {
    letters: %w(K),
    value: 5
  },
  {
    letters: %w(J X),
    value: 8
  },
  {
    letters: %w(Q Z),
    value: 10
  }
]

# make scores into a global hash
SCORE_CHART = {}
scores.each do |score| 
  score[:letters].each do |letter| 
    SCORE_CHART[letter] = score[:value]
  end
end

def score_word(word)
  total_points = 0

  word.upcase.each_char do |c|
    total_points += SCORE_CHART[c]
  end

  total_points += 8 if word.length >= 7

  return total_points
end

def break_tie(word_1, word_2)
  length_1 = word_1[:word].length
  length_2 = word_2[:word].length

  return word_1 if length_1 == length_2
  return word_1 if length_1 == 10
  return word_2 if length_2 == 10
  return length_1 < length_2 ? word_1 : word_2
end

def highest_score_from(words)
  winning_word = { word: nil, score: 0}

  words.each do |word|
    score = score_word(word) #the score of current word

    if score > winning_word[:score]
      winning_word[:score] = score
      winning_word[:word] = word
    elsif score == winning_word[:score] 
      winning_word = break_tie(winning_word, { word: word, score: score })
    end
  end

  return winning_word
end

