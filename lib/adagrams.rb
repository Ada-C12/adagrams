# Wave 1 - 10 letters (each letter is a string) for players hand
def draw_letters
  letters = {
    "A" => 9,
    "B" => 2,
    "C" => 2,
    "D" => 4, 
    "E" => 12, 
    "F" => 2,
    "G" => 3, 
    "H" => 2,
    "I" => 9, 
    "J" => 1,
    "K" => 1,
    "L" => 4,
    "M" => 2,
    "N" => 6,
    "O" => 8,
    "P" => 2,
    "Q" => 1,
    "R" => 6,
    "S" => 4,
    "T" => 6,
    "U" => 4,
    "V" => 2,
    "W" => 2,
    "X" => 1,
    "Y" => 2,
    "Z" => 1 
  }

  keys_only = letters.keys
  copy_of_letters = letters
  hand = []

  while hand.length < 10
    tile =  keys_only.sample
    tile_count = copy_of_letters["#{tile}"]
    if tile_count > 0
      copy_of_letters["#{tile}"] -= 1
      hand.push(tile)
    end
  end

  puts "HERE THE HAND"
  puts hand
  return hand
end 
user_hand = draw_letters

# Wave 2 - DOUBLE CHECK RETURN METHOD
puts "Give me a word"
word = gets.chomp.upcase

def uses_available_letters(input, letters_in_hand)
  word_array = input.split("")

  word_array.each do |letter|
    if letters_in_hand.include?(letter) == true
      letters_in_hand.slice!(letters_in_hand.index(letter))
      puts true
    else 
      puts false
    end 
  end 
end
# puts uses_available_letters(word, user_hand)

# Wave 3 
def score_word(word)
  score_chart = {
    1 => ["A", "E", "I", "O", "L", "N", "R", "S", "T"],
    2 => ["D", "G"],
    3 => ["B", "C", "M", "P"],
    4 => ["F", "H", "V", "W", "Y"],
    5 => ["K"],
    8 => ["J", "X"],
    10 => ["Q", "Z"]
  }

  score_total = 0
  word_array = word.upcase.split("")
  word_array.each do |letter|
    score = score_chart.find {|key, values|
      values.include?(letter)
    }.first
    score_total = score_total + score
  end 
  if word.length > 6
    score_total = score_total + 8
  end 
  return score_total
end
# score_word(word)

#wave 4 
def highest_score_from(words)
  final_scores = {}
  max_words = []

  words.each do |entry|
    final_scores[entry] = score_word(entry)
  end 
  scores_only = final_scores.values
  puts scores_only.max
  puts winning_word = final_scores.key(scores_only.max)
  
  final_scores.each do |key, value|
    if value == scores_only.max
      max_words.push(key)
    end 
  end 
  puts max_words
  
end 
highest_score_from(["rage", "dog", "at",])

# rage - 5
# dog - 5
# at - 2
# bed - 5

# then group by score
# 4: bed
# 2: at
# 5: rage, dog

# then compare word lengths of each wrd in the group