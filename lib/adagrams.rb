# Accesses the Dictionary file to read in user input later
require 'csv'
DICTIONARY = CSV.read('assets/dictionary-english.csv')

LETTERS = {A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9, J: 1, K: 1, L: 4, M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1}

# Method draws letters by plucking 10 random letters from the hash LETTERS and pushing it into a new array. 
def draw_letters
  letters_arr = []
  # letters_arr contains every instance of every letter available in the tile bag (ex. there are 9 string "i"s in the letters_arr)
  
  index_of_letters = []
  # index_of_letters contains the indexes of each instance of every letter in letters_arr
  
  letters_in_hand = []
  # letters_in_hand contains the randomly selected letters from letters_arr
  
  LETTERS.each do |letter, qty|
    qty.times do 
      letters_arr.push(letter.to_s)
    end
  end
  # We delete the index from index_of_letters in order to prevent pulling the same tile twice.
  index_of_letters = (0..(letters_arr.length - 1)).to_a
  pluck = 10
  pluck.times do 
    index = rand(0..(index_of_letters.length-1))
    while !index_of_letters.include?(index)
      index = rand(0..(index_of_letters.length-1))
    end
    letters_in_hand.push(letters_arr[index])
    index_of_letters.delete(index)
  end
  return letters_in_hand
end

# This method checks that the letters_in_hand contains the plucked letters from previous method
def uses_available_letters? (input, letters_in_hand)
  # Make a copy of the letters_in_hand in order to maintain the original array of values
  letters_in_hand_copy = []
  letters_in_hand_copy += letters_in_hand
  input.split('').each do |tile|
    if letters_in_hand_copy.include?(tile)
      index_of_tile = letters_in_hand_copy.index(tile)
      letters_in_hand_copy.delete_at(index_of_tile)
    else
      return false
    end
  end     
  return true
end    

# Sum up the score per provided letter score values for each letter used by player
# Add an additional 8 points for word length between 7 and 10, inclusively. 
def score_word(word)
  score = 0
  word.upcase.split('').each do |letter|
    case letter
    when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      score += 1
    when "D", "G"
      score += 2
    when "B", "C", "M", "P"
      score += 3
    when "F", "H", "V", "W", "Y"
      score += 4
    when "K"
      score += 5
    when "J", "X"
      score += 8
    when "Q", "Z"
      score += 10
    end
  end
  if word.length>=7 && word.length<=10
    score += 8
  end
  return score
end

# This method finds the highest scoring word by creating a hash containing keys of scores and values that are an array of words matching that score. 
# Finds the max of the keys and then proceeds through the array's values, selecting shortest word unless there is a word of length 10. 
def highest_score_from(words)
  words_scores = {}
  words.each do |word|
    score = score_word(word)
    if !words_scores[score]
      words_scores[score] = [word]
    else
      words_scores[score].push(word)
    end
  end
  highest_scores = words_scores[words_scores.keys.max]
  
  highest_scores.each do |word|
    if word.length == 10
      return {word: word, score: words_scores.keys.max}
    end
  end
  shortest_word = highest_scores.min_by { |word| word.length }
  return {word: shortest_word, score: words_scores.keys.max}
end

# OPTIONAL METHOD: Reads from a dictionary csv to determine if input is a valid word or not. To run wave-5-game.rb must access file from adagrams directory. 
def is_in_english_dict?(input)
  return DICTIONARY.include?([input.downcase]) ? true : false
end