require 'csv'

####################### WAVE 1 ##########################
# preliminary set up
letters = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z]
freq = %w[9 2 2 4 12 2 3 2 9 1 1 4 2 6 8 2 1 6 4 6 4 2 2 1 2 1]

freq = freq.map do |number_string|
  number_string.to_i
end

# Assemble fresh new bag of tiles
PILE = []
letters.length.times do |index|
  freq[index].times do
    PILE << letters[index]
  end
end

def draw_letters
  return PILE.sample(10)
end

####################### WAVE 2 ##########################

def uses_available_letters?(input, letters_in_hand)
  clone_letters_in_hand = letters_in_hand.dup
  
  # splits input into individual capital letters 
  input_array = input.split(//)
  input_array = input_array.map { |letter| letter.upcase }
  
  if input.length > clone_letters_in_hand.length
    return false
  elsif input.length == 0
    return false
  end
  
  # check letters against letters_in_hand
  input_array.length.times do |index|
    if clone_letters_in_hand.include? input_array[index]
      garbage_index = clone_letters_in_hand.rindex(input_array[index])
      clone_letters_in_hand.delete_at(garbage_index)
    else
      return false
    end       
  end
  
  return true
end

####################### WAVE 3 ##########################

def score_word(word)
  score_hash = { A: 1, E: 1, I: 1, O: 1, U: 1, L: 1, N: 1, R: 1, S: 1, T: 1, 
    D: 2, G: 2, B: 3, C: 3, M: 3, P: 3, F: 4, H: 4, V: 4, W: 4, Y: 4, 
    K: 5, J: 8, X: 8, Q: 10, Z: 10 }
    
    word_array = word.upcase.split(//)
    score = 0
    
    word_array.each do |letter|
      score += score_hash[letter.to_sym] 
    end
    
    if word_array.length >= 7 && word_array.length < 11
      score += 8
    end
    
    return score
  end
  
  ####################### WAVE 4 ##########################
  words = []
  
  def highest_score_from(words)
    highest_score = 0
    winner = nil
    
    words.each do |word|
      score = score_word(word)
      
      if score > highest_score
        highest_score = score
        winner = word
      elsif score == highest_score && winner.length != 10
        if word.length == 10 || (word.length < winner.length)
          winner = word
        end
      end
    end
    
    return {word: winner, score: highest_score}
  end
  
  ####################### WAVE 5 ##########################
  
  def is_in_english_dict?(input)
    all_words = CSV.read('assets/dictionary-english.csv')
    input = [input.downcase]
    return all_words.include? input
  end
  
  