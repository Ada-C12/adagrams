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

def score_word(word)
  word_arr = word.upcase.split("")
  points = 0
  word_arr.each do |letter|
    case letter
    when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      points += 1
    when "D", "G"
      points += 2
    when "B", "C", "M", "P"
      points += 3
    when "F", "H", "V", "W", "Y"
      points += 4
    when "K"
      points += 5
    when "J", "X"
      points += 8
    when "Q", "Z"
      points += 10
    end
  end
  
  if word_arr.length >= 7
    points += 8
  end
  
  return points
end


#return :word and :score
def highest_score_from(words)
  word_score = {}
  
  words.each do |word|
    word_score[word] = score_word(word)
  end
  
  max = word_score.values.max
  
  winners = word_score.select {|k,v| v == max}
  
  winners.each do |key, value|
    if key.length == 10
      return {key => value}
    else 
      min = winners.min_by {|k,v| k.length}
      return {word: min[0], score: min[1]}
    end
  end
  
end