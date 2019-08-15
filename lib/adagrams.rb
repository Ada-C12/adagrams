require 'pry'
def draw_letters
  all_letters_hash = {
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
    "Z" => 1,
  }
  all_letters_array = Array.new
  all_letters_hash.each do |letter, number|
    number.times do
      all_letters_array << letter
    end
  end
  letters_in_hand = all_letters_array.sample(10)
end

def uses_available_letters?(input, letters_in_hand)
  input = input.chars
  # Make new hash to store letters and occurrence
  letter_count = Hash.new(0)
  letters_in_hand.each do |letter|
    letter_count[letter] += 1
  end
  
  # Check the hand array against the available letters hash
  input.each do |letter|
    if letters_in_hand.include?(letter)
      letter_count[letter] -= 1
      if letter_count[letter] < 0
        return false
        break
      end
    else
      return false
      break
    end
  end
  return true
end

def score_word(word)
  # Make new hash to store letters and point values
  points = {
    "A" => 1,
    "B" => 3,
    "C" => 3,
    "D" => 2,
    "E" => 1,
    "F" => 4,
    "G" => 2,
    "H" => 4,
    "I" => 1,
    "J" => 8,
    "K" => 5,
    "L" => 1,
    "M" => 3,
    "N" => 1,
    "O" => 1,
    "P" => 3,
    "Q" => 10,
    "R" => 1,
    "S" => 1,
    "T" => 1,
    "U" => 1,
    "V" => 4,
    "W" => 4,
    "X" => 8,
    "Y" => 4,
    "Z" => 10
  }
  input_array = word.upcase.chars
  total_points = input_array.map do |letter|
    points[letter]
  end
  
  if input_array.size >= 7 && input_array.size < 11
    return total_points.sum + 8
  end
  # if total_points.empty?
  #   return 0
  # end
  return total_points.sum
end

def highest_score_from(words)
  # Put qualifying words and their scores into a hash
  winning_words = Hash.new
  words.each { |word| winning_words[word] = score_word(word)}
  # Find highest score
  winning_words.select! {|key, value| value == winning_words.values.max}
  # If there are multiple words with that highest score...
  # The first one with ten letters gets returned, whether there is one or are multiple
  if winning_words.length > 1
    if winning_words.include?(key.length(10))
      winning_words.select! {|key, value| key.length == 10}
      high_score_hash = {
        word: winning_words.keys[0],
        score: winning_words.values[0]
      }
      return high_score_hash
    else
      winning_words.min_by {|key, value| key == key.length}
      high_score_hash = {
        word: winning_words.keys[0],
        score: winning_words.values[0]
      }
      return high_score_hash
    end
  end
  
  
  #   current_score = score_word(word)
  #   p word
  #   p "current score: #{current_score}"
  #   if current_score > winning_word[:score]
  #     winning_word[:word] = word
  #     winning_word[:score] = current_score
  #     p winning_word
  #   elsif current_score == winning_word[:score] && word.size == 10
  #     winning_word[:word] = word
  #     winning_word[:score] = current_score
  #     p winning_word
  #   elsif current_score == winning_word[:score] && word.length < winning_word[:word].length
  #     winning_word[:word] = word
  #     winning_word[:score] = current_score
  #     p winning_word
  #   elsif current_score == winning_word[:score] && word.length == winning_word[:word].length
  #     p winning_word
  #   end
  # end
  #   return winning_word
  # end
  
  