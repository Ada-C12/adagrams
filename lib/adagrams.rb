require 'csv'

# -  Wave 1 -

# Create method called draw_letter to build a hand of 10 letters for the user
def draw_letters
  
  # Create distribution of letters
  letters = {
    "9" => ["A", "I"], 
    "4" => ["D", "L", "S", "U"], 
    "2" => ["B", "C", "F", "H", "M", "P", "V", "W", "Y"],  
    "12" => ["E"],  
    "3" => ["G",],
    "1" => ["J", "K", "Q", "X", "Z"],
    "6" => ["N", "R", "T"],
    "8" => ["O"],
  }
  # Create empty array to hold multiples of the same letters
  letter_pool = []
  
  # Get multiples of the same letters by iterating a single letter times the hash key's number
  letters.each do |key, value|
    key_i = key.to_i
    key_i.times do
      value.each do |string|
        letter_pool << string
      end
    end
  end
  
  # Generate user's hand containing 10 random letters from the pool of letters
  generate_hand = []
  10.times do
    generate_hand << letter_pool.shuffle.last
    letter_pool.pop
  end
  return generate_hand
end


# -  Wave 2 - 

# Create method uses_available_letter?
# Method checks if the letters in the user's word matches the collection of drawn letters
def uses_available_letters?(test_word, drawn_letters)
  
  # Create duplicate of drawn_letters to ensure data in this array does not change
  drawn_letters_2 = drawn_letters.dup
  # Take users's word and identify each character in that word
  input_letters = test_word.split('')
  input_letters = input_letters.map {|letter| letter.upcase}
  input_letters.each do |letter|
    # Verify user's word character against collection of drawn letters
    index = drawn_letters_2.index(letter)
    # If user's word character exist in the collection of drawn letters,
    # delete character from collection of drawn letters to account for repeats of same letter
    if index != nil
      drawn_letters_2.delete_at(index)
    else
      return false
    end
  end
  return true
end


# -  Wave 3 - 

# Create method score_word to return the score of a given word as defined by game's point value
def score_word(word)
  score_chart = {
    "1" => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
    "2" => ["D", "G"],
    "3" => ["B", "C", "M", "P"],
    "4" => ["F", "H", "V", "W", "Y"],
    "5" => ["K"],
    "8" => ["J", "X"],
    "10" => ["Q", "Z"]
  }
  
  split_word = word.split('')
  split_word = split_word.map {|letter| letter.upcase}
  
  sum = 0
  points = 0
  # Get value/point of each letter and add it all together in 'sum'
  split_word.each do |letter|
    score_chart.each do | key, value|
      if value.include?(letter)
        points = key.to_i
      end
    end
    
    sum += points
    
  end
  
  # If length o fthe word is 7, 8, 9 or 10, then the word gets an additional 8 points
  if split_word.length > 6
    sum += 8
  end
  return sum
end



# Wave 4

# Create method called highest_score_from
# To find the highest scoring word
def highest_score_from(words)
  # Create hash named scores to hold word as the key and score of that word as the value
  scores = {}
  # Find the score of each word and matched to that word key in the hash
  words.each do |word|
    score = score_word(word)
    scores[word] = score
  end
  
  # Find the highest score
  max = scores.values.max
  
  # Multiple words have the same max score - aka, a tie
  winners = []
  winner = {}
  scores.each do |word,score|
    if score == max
      winner = {
        word: "#{word}",
        score: max
      }
      winners << winner
    end
  end 
  
  # Find the tie-breaker
  if winners.length > 1
    min = 11
    tie_word = nil
    tie_word_score = nil
    
    winners.each do |word_hash|
      # If one of the tie-breaker words is 10 letters long, then the word with 10 letters win
      if word_hash[:word].length == 10
        return {
          word:"#{word_hash[:word]}",
          score: word_hash[:score]
        }
        # Else the word with the least letters win the tie-breaker
      elsif word_hash[:word].length < min
        min = word_hash[:word].length
        tie_word = word_hash[:word]
        tie_word_score = word_hash[:score]
      end
    end
    
    return {
      word: tie_word,
      score: tie_word_score
    }
    
    # Return winner if there is no tie-breaker scenario
  else
    return winners[0]
  end
end

# Create method is_in_english_dict?
# Verify player's word is valid against the English dictionary
def is_in_english_dict?(input)
  dictionary = CSV.read('assets/dictionary-english.csv')
  return dictionary.include?(input)
end