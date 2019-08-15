# -  Wave 1 -
def draw_letters
  letter_pool = {
    "9" => ["A", "I"], 
    "4" => ["D", "L", "S", "U"], 
    "2" => ["B", "C", "F", "H", "M", "P", "V", "W", "Y"],  
    "12" => ["E"],  
    "3" => ["G",],
    "1" => ["J", "K", "Q", "X", "Z"],
    "6" => ["N", "R", "T"],
    "8" => ["O"],
  }
  
  letters = []
  
  letter_pool.each do |key, value|
    key_i = key.to_i
    key_i.times do
      value.each do |string|
        letters << string
      end
    end
  end
  
  generate = []
  10.times do
    generate << letters.shuffle.last
    letters.pop
  end
  return generate
end


# -  Wave 2 - 
def uses_available_letters?(test_word, drawn_letters)
  drawn_letters_2 = drawn_letters.dup
  input_letters = test_word.split('')
  input_letters = input_letters.map {|letter| letter.upcase}
  input_letters.each do |letter|
    index = drawn_letters_2.index(letter)
    if index != nil
      drawn_letters_2.delete_at(index)
    else
      return false
    end
  end
  return true
end


# # puts uses_available_letters?("kada", ["A","D","A","C","K"])


# -  Wave 3 - 
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
  split_word.each do |letter|
    score_chart.each do | key, value|
      if value.include?(letter)
        points = key.to_i
      end
    end
  
    sum += points
  
  end
  
  if split_word.length > 6
    sum += 8
  end
  return sum
end


  
# Wave 4
# require 'pry'

def highest_score_from(words)
  scores = {}
  words.each do |word|
    score = score_word(word)
    # binding.pry
    scores[word] = score
  end
  
  max = scores.values.max

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

  if winners.length > 1
    min = 11
    win_word = nil
    win_word_score = nil
    
    winners.each do |word_hash|
      if word_hash[:word].length == 10
        return {
          word:"#{word_hash[:word]}",
          score: word_hash[:score]
        }
      elsif word_hash[:word].length < min
        min = word_hash[:word].length
        win_word = word_hash[:word]
        win_word_score = word_hash[:score]
      end
    end
    
    return {
      word: "#{win_word}",
      score: win_word_score
    }

  else
    return winners[0]
  end
  
end

words =  ['BBBBBB', 'AAAAAAAAAA']
answer = highest_score_from(words)
puts answer[:word]
puts answer[:score]


# return winner

# end
