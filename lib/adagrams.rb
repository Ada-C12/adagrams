require 'csv'

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

  return hand
end 

def uses_available_letters?(input, letters_in_hand)
  copy_of_hand = letters_in_hand.dup
  word_array = input.upcase.split("")
  result = nil

  word_array.each do |letter|
    if copy_of_hand.include?(letter) == true
      copy_of_hand.slice!(copy_of_hand.index(letter))
      result = true
    else 
      result = false
      break
    end 
  end
  return result
end

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
    score_total += score
  end 
  if word.length > 6
    score_total += 8
  end 
  return score_total
end

def highest_score_from(words)
  winning_hash = {}
  final_scores = {}
  winning_words = []

  words.each do |entry|
    final_scores[entry] = score_word(entry)
  end 
  scores_only = final_scores.values

  
  final_scores.each do |key, value|
    if value == scores_only.max
      winning_words.push(key)
    end 
  end 

  winning_word = nil
  sorted_words = winning_words.sort_by(&:length)
  sorted_words.each do |word|
    if word.length == 10
      winning_word = word
      break
    else
      winning_word = sorted_words.first
    end
  end

  winning_hash[:score] = scores_only.max
  winning_hash[:word] = winning_word
  return winning_hash
end 

# WAVE 5 - OPTIONAL
#when running w/o wave-5 file, add .. to csv location ("../assets..")
def is_in_english_dict? (input)
  dictionary = CSV.read("/assets/dictionary-english.csv")
  input_array = []
  verdict = ""

  input_array.push(input)

  if dictionary.include?(input_array) == true
    verdict = true
  else 
    verdict = false
  end 
  return verdict
end 
# puts is_in_english_dict?("emoji")