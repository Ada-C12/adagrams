
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
  
  array_letters = quantity_by_letter.map do |letter, quantity|
    letter.to_s * quantity
  end
  
  array_letters = array_letters.join("")
  array_letters = array_letters.split('')
  
  array_hand = array_letters.sample(10)
  
  return array_hand
  
end

# Wave 2

def uses_available_letters?(user_input_word, letters_in_hand)
  user_input_array = user_input_word.upcase.split("")
  # remainder_hand = letters_in_hand
  
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
  
  word = word.upcase.split("")
  
  score = 0
  
  word.each do |character|
    score += values_by_letter[character.to_sym]
  end
  
  if word.length >= 7
    score += 8
  else
    score
  end
  
  return score
  
end

# Wave 4

def highest_score_from_words(words)
  scores_by_word = {}
  words.each do |word|
    scores_by_word[word] = score_word(word)
  end
  
  p scores_by_word
end

# We'll create a hash and we'll use max_by score. 
