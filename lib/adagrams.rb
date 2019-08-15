def draw_letters
  all_letters = []
  alphabet = {"A": 9, "B": 2, "C":2, "D": 4, "E": 12, "F": 2, "G": 3, "H": 2, "I": 9, "J": 1, "K": 1, "L": 4, "M": 2, "N": 6, "O": 8, "P": 2, "Q": 1, "R": 6, "S": 4, "T": 6, "U": 4, "V": 2, "W": 2, "X": 1, "Y": 2, "Z": 1}
  alphabet.each do |letter, quantity|
    letters = []
    count = 0
    while (count < quantity)
      letters << letter.to_s
      count += 1
    end
    all_letters << letters
    all_letters = all_letters.flatten
  end
  user_hand = all_letters.sample(10)
  return user_hand
end


#WAVE 2
# def uses_available_letters?(input, letters_in_hand)
#   result = true
#   input = input.upcase
#   input_array = input.chars
#   input_array.each do |char|
#     if !letters_in_hand.include?(char)
#       puts "this didn't work"
#       result = false
#     else
#       letters_in_hand.delete_at(letters_in_hand.index(char))
#     end
#   end
#   #p letters_in_hand
#   return result
# end

def uses_available_letters?(input, letters_in_hand)
  result = true
  input_array = input.upcase.chars
  letters_in_hand2 = []
  letters_in_hand2 += letters_in_hand
  input_array.each do |char|
    if !letters_in_hand2.include?(char)
      puts "this didn't work"
      result = false
    else
      letters_in_hand2.delete_at(letters_in_hand2.index(char))
    end
  end
  #p letters_in_hand
  return result
end

# puts "Enter a word."
# user_word = gets.chomp.upcase
# word_array = user_word.chars

# users_available_letters?(word_array, hand)

#WAVE 3
def score_word(word)
  score_chart = {"A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1, "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1,  
    "D" => 2, "G" => 2, 
    "B" => 3, "C" => 3, "M" => 3, "P" => 3, 
    "F" => 4, "H" => 4, "V" => 4, "W" => 4, "Y" => 4, 
    "K" => 5, 
    "J" => 8, "X" => 8,
    "Q" => 10, "Z" => 10}
    
    word = word.upcase
    word_array = word.chars
    score = 0
    if word_array.length >= 7
      score = 8
    end
    word_array.each do |char|
      points = score_chart[char]
      points = points.to_i
      score += points
    end
    p score
    #return score
  end
  
  
  # score_word(word_array)
  
  #WAVE 4
  
  # def highest_score_from(words)
  #   # Returns a single hash that represents the data of a winning word and its score. The hash should have the following keys:
  # # :word, whose value is a string of a word
  # # :score, whose value is the score of that word
  #   highest_score = {word: [], score: 0}
  #   word_list = score_word(word)
  
  
  
  # # In the case of tie in scores, use these tie-breaking rules:
  # # prefer the word with the fewest letters...
  # # ...unless one word has 10 letters. If the top score is tied between multiple words and one is 10 letters long, choose the one with 10 letters over the one with fewer tiles
  # # If the there are multiple words that are the same score and the same length, pick the first one in the supplied list
  
  # end
  
  # highest_score_from(user_word)