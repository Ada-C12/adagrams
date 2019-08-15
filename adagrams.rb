require 'pry'

letter_pool = %w(a a a a a a a a a b b c c d d d d e e e e e e e e e e e e f f g g g h h i i i i i i i i i j k l l l l m m n n n n n n o o o o o o o o p p q r r r r r r s s s s t t t t t t u u u u v v w w x y y z)



# Wave one method
def draw_letters
  remaining_pool = %w(a a a a a a a a a b b c c d d d d e e e e e e e e e e e e f f g g g h h i i i i i i i i i j k l l l l m m n n n n n n o o o o o o o o p p q r r r r r r s s s s t t t t t t u u u u v v w w x y y z)
  remaining_pool.map!(&:upcase)
  letters_in_hand = []
  
  10.times do |letter|
    letter = remaining_pool.sample
    letters_in_hand.push(letter)
    remaining_pool.slice!(remaining_pool.index(letter))
  end 
  # p remaining_pool
  return letters_in_hand
end 



# Wave 2: uses_available_letters?
# Need to review lines 57-67, b/c failing test for returning true if the submitted letters are valid against the drawn letters
def uses_available_letters?(input, letters_in_hand)
  
  # Make input word uppercase and then split it into an array
  input_array = input.upcase.chars
  
  # Check if the input string's characters exist in the user hand 
  
  input_array.each do |letter|
    unless letters_in_hand.include?(letter) 
      return false
    end
  end 
  
  # Check if the input string's characters do not exceed the amount of characters 
  # available in letters_in_hand
  # Making a hash from letters_in_hand with letters as keys, and counts as values
  letters_hand_hash = {} 
  letters_in_hand.each do |letter| #looping thru hand, counting instances of each character
    
    found_letter = letter
    if letters_hand_hash.key?(found_letter)
      letters_hand_hash[found_letter] += 1
    else
      letters_hand_hash[found_letter] = 1
    end 
  end 
  
  # making a hash from user_input with letters as keys and counts as values 
  input_hash = {}
  input_array.each do |letter|
    count_letter = letter
    if input_hash.key?(count_letter)
      input_hash[count_letter] += 1
    else
      input_hash[count_letter] = 1
    end
  end 
  
  # comparing input_hash to hand_hash
  input_hash.each do |letter, count|
    if letters_hand_hash.key?(letter)
      hand_count = letters_hand_hash[letter]
      if hand_count >= count
        next
      else
        return false
      end 
    end
  end 
  return true 
  
end 

# Wave 3
def score_word(word)
  input_array = word.upcase.chars
  
  scores = []
  # Calculating the score for each letter in word 
  input_array.each do |word|
    if word == "A" || word == "E" || word == "I" || word == "O" || word == "U" || word == "L" || word == "N" || word == "R" || word == "S" || word == "T"
      scores.push(1)
    elsif word == "D" || word == "G"
      scores.push(2)
    elsif word == "B" || word == "C" || word == "M" || word == "P"
      scores.push(3)
    elsif word == "F" || word == "H" || word == "V" || word == "W" || word == "Y"
      scores.push(4)
    elsif word == "K"
      scores.push(5)
    elsif word == "J" || word == "X"
      scores.push(8)
    elsif word == "Q" || word =="Z"
      scores.push(10)
    end 
  end 
  
  # Calculating the sum for all the letters in word 
  sum = 0
  scores.each do |score|
    sum = sum + score
  end 
  
  # If the length of word is between 7-10, add 8 points to the total score 
  if input_array.length == 7 || input_array.length == 8 || input_array.length == 9 || input_array.length == 10
    sum = sum + 8
  end 
  
  return sum
  
end 

# Wave 4
def highest_score_from(words)
  # "words" is an array of strings that is provided via driver code
  word_scores = [] #contains score for each word
  word_lengths = [] #contains lengths for each word
  
  # need to either define or get rid of "word"
  
  words.each do |word|
    word_letters = word.chars #convert string to array of characters
    word_length = word_letters.length #count the length of characters 
    word_lengths.push(word_length) #add the length of the word into word_lengths list
    #calculate the score for each word
    final_score = score_word(word) 
    word_scores.push(final_score) #add the score for each word in a list
  end 
  
  # determine which word has the highest score and return associated word
  highest_score = word_scores.max
  
  # determines the word that corresponds to the highest_score
  word_with_highest_score = words[word_scores.index(highest_score)]
  
  # make hash to return winning word and associated score
  winning_word = {}
  winning_word[:word] = word_with_highest_score
  winning_word[:score] = highest_score
  p winning_word
  
  return winning_word
end 
