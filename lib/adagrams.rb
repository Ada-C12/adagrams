require 'pry'
# Wave 1

def draw_letters
  quantity_by_letter = {
    A: 9,
    B: 2,
    C: 2,
    D: 4,
    E: 12,
    F: 2,
    G: 3,
    H: 2,
    I: 9,
    J: 1,
    K: 1,
    L: 4,
    M: 2,
    N: 6,
    O: 8,
    P: 2,
    Q: 1,
    R: 6,
    S: 4,
    T: 6,
    U: 4,
    V: 2,
    W: 2,
    X: 1,
    Y: 2,
    Z: 1
  }
  
  # Put quantity of each bank of letters in an arry
  array_letters = quantity_by_letter.map do |letter, quantity|
    letter.to_s * quantity
  end
  
  array_letters = array_letters.join("")
  array_letters = array_letters.split('')
  
  # Create hand for the user
  array_hand = array_letters.sample(10)
  
  return array_hand
  
end

# Wave 2
# A method that will return true if user enters same letters in hand, else false
def uses_available_letters?(user_input_word, letters_in_hand)
  # Create array of user input - make uppercase
  user_input_array = user_input_word.upcase.split("")
  
  hand_hash = Hash.new(0)
  input_hash = Hash.new(0)
  
  # Hash from hand - quantity of individual letters
  letters_in_hand.each do |character|
    hand_hash[character] += 1
  end
  
  # Hash from user input - quantity of individual letters
  user_input_array.each do |character|
    input_hash[character] += 1
  end
  
  # Compare quantity of letters between hands
  validator = 0
  
  user_input_array.each do |character|
    unless input_hash[character] <= hand_hash[character]
      validator +=1
    end
  end
  
  return validator == 0
  
end

# Wave 3
def score_word(word)
  values_by_letter = {
    A: 1,
    B: 3,
    C: 3,
    D: 2,
    E: 1,
    F: 4,
    G: 2,
    H: 4,
    I: 1,
    J: 8,
    K: 5,
    L: 1,
    M: 3,
    N: 1,
    O: 1,
    P: 3,
    Q: 10,
    R: 1,
    S: 1,
    T: 1,
    U: 1,
    V: 4,
    W: 4,
    X: 8,
    Y: 4,
    Z: 10
  }
  
  # Make user input into an array (all uppercase)
  word = word.upcase.split("")
  
  score = 0
  
  # Look up each character for score value
  word.each do |character|
    score += values_by_letter[character.to_sym]
  end
  
  # Add points for long words
  if word.length >= 7
    score += 8
  else
    score
  end
  
  return score
  
end

# Wave 4

# HALLIE'S
def highest_score_from(words)
  
  # Create a hash from words array with word as key and score as value
  scores_by_word = {}
  words.each do |word|
    scores_by_word[word] = score_word(word)
  end
  
  # Stores the highest scoring word
  high_score_hash = {
    word: "",
    score: 0
  }
  
  # Find highest score in the hash and populate hash
  highest_score = scores_by_word.max_by { |word, score| score }
  
  high_score_hash[:word] = highest_score[0]
  high_score_hash[:score] = highest_score[1]
  
  # TIES
  tied_words = []
  
  # If any word in the word array matches highest score, add to tied_words array
  scores_by_word.each do |word, score|
    if score == highest_score[1]
      tied_words << word
    end
  end
  
  # Establish that there ARE ties
  if tied_words.length > 1
    
    # Take first word that has 10 letters, if any.
    tied_words.each do |word|
      if word.split("").length == 10
        high_score_hash[:word] = word
        high_score_hash[:score] = score_word(word)
        return high_score_hash
      end
    end
  end
  
  # Take the smallest word in the tied_words array
  if tied_words.length > 1
    smallest_word = tied_words.min_by { |x| x.length } 
    high_score_hash[:word] = smallest_word
    high_score_hash[:score] = score_word(smallest_word)
    return high_score_hash
  end
  
  return high_score_hash
end
