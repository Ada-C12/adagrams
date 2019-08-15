require 'pry'


def draw_letters
  letters_in_hand = ARRAY_OF_LETTERS.shuffle.slice(1..10)
  return letters_in_hand
end

ARRAY_OF_LETTERS = ["A", "A", "A", "A", "A", "A", "A", "A", "A", "B", "B", "C", "C", "D", "D", "D", "D", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "F", "F", "G", "G", "G", "H", "H", "I", "I", "I", "I", "I", "I", "I", "I", "I", "J", "K", "L", "L", "L", "L", "M", "M", "N", "N", "N", "N", "N", "N", "O", "O", "O", "O", "O", "O", "O", "O", "P", "P", "Q", "R", "R", "R", "R", "R", "R", "S", "S", "S", "S", "T", "T", "T", "T", "T", "T", "U", "U", "U", "U", "V", "V", "W", "W", "X", "Y", "Y", "Z"]

def uses_available_letters? (input, letters_in_hand)
  input = input.upcase.chars
  dup_letters_in_hand = letters_in_hand.clone
  
  
  input.each do |chars|
    if dup_letters_in_hand.include?(chars)
      dup_letters_in_hand.delete(chars)
    else 
      return false
    end
  end
  
  check = 0
  input.each do |chars|
    if letters_in_hand.include?(chars)
      check = 0
    else
      check += 1
    end
  end
  return check == 0
end

def score_word(word)
  letter_points = {
    "A" => 1, "B" => 3, "C" => 3, "D" => 2, "E" => 1, "F" => 4, "G" => 2, "H" => 4, "I" => 1, "J" => 8, "K" => 5, "L" => 1, "M" => 3, "N" => 1, "O" => 1, "P" => 3, "Q"=> 10, "R"=> 1, "S" => 1, "T" => 1, "U" => 1, "V" => 4, "W" => 4, "X" => 8, "Y" => 4, "Z" => 10
  }
  word_array = word.upcase.chars
  word_points = word_array.map do |k, v|
    letter_points[k]
  end
  total_points = word_points.sum
  if word.length > 6 && word.length < 11
    total_points += 8
  end
  return total_points
end

def highest_score_from(words)
  highest_score_hash = {}
  score = 0
  winning_word = ""
  
  words.each do |object|
    word_score = score_word(object)
    if word_score > score
      score = word_score
      winning_word = object
    elsif word_score == score
      length_of_obj = object.length
      length_of_winning_word = winning_word.length
      if length_of_winning_word == 10
        winning_word = winning_word
      elsif length_of_obj == 10
        winning_word = object
      else
        winning_word = tiebreaker_length(winning_word, object)
      end 
    end
    highest_score_hash[:word] = winning_word
    highest_score_hash[:score] = score
  end
  return highest_score_hash
end 

def tiebreaker_length (old_word, new_word)
  tiebreaker_len_arr = [old_word, new_word]
  tiebreaker_len_arr.min { |old_word, new_word| old_word.length <=> new_word.length }  
end