require "pry"

def draw_letters
  alphabet_soup = {
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
    Z: 1,
  }
  hand = []
  10.times do |letter, quantity|
    letter_selection = alphabet_soup.keys.sample

    while alphabet_soup[letter_selection] == 0
      letter_selection = alphabet_soup.keys.sample
    end
    alphabet_soup[letter_selection] -= 1

    hand << letter_selection.to_s
  end
  return hand
end

def uses_available_letters?(input, letters_in_hand)
  dup_array = letters_in_hand.dup

  return input.upcase.split(//).all? do |letter|
           included = dup_array.include?(letter)
           dup_array.delete(letter)
           included
         end
end

def score_word(word)
  score = 0

  word_array = word.upcase.split(//)
  word_array.each do |letter|
    case letter

    when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
      score += 1
    when "D", "G"
      score += 2
    when "B", "C", "M", "P"
      score += 3
    when "F", "H", "V", "W", "Y"
      score += 4
    when "K"
      score += 5
    when "J", "X"
      score += 8
    when "Q", "Z"
      score += 10
    end
  end

  if word.length > 6 && word.length < 11
    score += 8
  end
  return score
end

def highest_score_from(words)
  winning_words = {
    word: "",
    score: 0,
  }
  new_hash = {}
  score_array = words.map { |string| score_word(string) }
  words.zip(score_array) { |word, score| new_hash[word] = score }

  # new_hash = words.group_by { |each_play| score_word(each_play) }
  max_score = new_hash.values.max

  score_check = new_hash.select { |word, score| score == max_score }

  score_check.each do |word, score|
    if word.length == 10
      winning_words[:word] = word
      winning_words[:score] = score

      # binding.pry
      return winning_words
    elsif score_check.keys.min_by do |each_word|
      each_word.length
      winning_words[:word] = word
      winning_words[:score] = score

      # binding.pry
      return winning_words
    end
    end
  end
  # highest_score = 0
  # index_of_highest_value = 0

  # score_array = words.map { |string| score_word(string) }
  # length_array = words.map { |string| string.length }

  # score_array.each_with_index do |index, value|
  #   if value > highest_score
  #     highest_score = value
  #     index_of_highest_value = index

  # end
end
