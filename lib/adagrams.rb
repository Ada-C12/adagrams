require 'pry'

def draw_letters
  
  letter_pool_hash = {
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
    "Z" => 1
  }
  
  letter_pool_array = letter_pool_hash.map do |letter, amount|
    (letter * amount).split("")
  end
  
  letter_pool_array = letter_pool_array.flatten
  
  drawn_letters = letter_pool_array.sample(10)
  return drawn_letters
  
end

def uses_available_letters? (input, letters_in_hand)
  
  copy_of_hand = letters_in_hand.clone
  letters_of_input = input.upcase.split("")
  
  letters_of_input.each do |letter_from_input|
    if copy_of_hand.include? letter_from_input
     
      index_of_input_letter = copy_of_hand.index(letter_from_input)
      copy_of_hand.delete_at(index_of_input_letter)

    else

      copy_of_hand = letters_in_hand.clone
      return false

    end
  end

  return true
  
end

def score_word(word)
  
  points_hash = {
    1 => %w[A E I O U L N R S T],
    2 => %w[D G],
    3 => %w[B C M P],
    4 => %w[F H V W Y],
    5 => %w[K],
    8 => %w[J X],
    10 => %w[Q Z]
  }
  
  # points_hash = {
  #   1 => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
  #   2 => ["D", "G"],
  #   3 => ["B", "C", "M", "P"],
  #   4 => ["F", "H", "V", "W", "Y"],
  #   5 => ["K"],
  #   8 => ["J", "X"],
  #   10 => ["Q", "Z"]
  # } # we could swap this so that letters are keys and points value
  
  word_array = word.upcase.split("")
  
  word_points = word_array.map do |letter|
    points_variable = 0 # if we swap, find the value of a given key - make sure to keep a zero
    points_hash.each do |points, letter_category| # could it be a different enumerable?
      if letter_category.include? letter
        points_variable = points
      end
    end
    points_variable
  end
  
  if word_array.length >= 7 
    word_points << 8
  end
  
  return word_points.sum
  
end    

def highest_score_from(words)
  # make hash of all words and their score {word => score, word => score}
  scores_hash = {} 
  words.each do |word|
    scores_hash[word] = score_word(word)
  end
  
  # use select to create new hash of key-value pairs that all equal max score
  highest_score = scores_hash.values.max
  highest_scores_hash = scores_hash.select do |word, score|
    score == highest_score
  end
  
  # tie breaking and returning correct format winner

  # if there's just 1, winner
  if highest_scores_hash.length == 1
    return {word: highest_scores_hash.keys[0], score: highest_scores_hash.values[0]}
  else
    highest_scores_hash.each do |word, score|
      if word.length == 10
        return {word: word, score: score}
      end
    end

    min_length = highest_scores_hash.map { |word, score| word.length }.min
    highest_scores_hash.each do |word, score|
      if word.length == min_length
        return {word: word, score: score}
      end
    end
  end
end
