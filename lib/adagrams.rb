require 'csv'

def draw_letters()
  distribution = {
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
  
  # WAVE 1
  
  # convert distribution hash to letters array with all available letters
  letters = []
  distribution.each do |letter, quantity|
    quantity.times { letters << letter.to_s }
  end
  
  # push 10 random letters to strings array, removing letter from letters array each time to prevent repitition
  drawn_letters = []
  10.times do
    letters.shuffle!
    drawn_letters << letters.pop
  end
  
  return drawn_letters
end

# WAVE 2
def uses_available_letters?(input, letters_in_hand)
  current_letters_in_hand = letters_in_hand.dup
  # split user input into array of chararacters
  characters = input.upcase.split('')
  # for each character, save index number to index variable
  characters.each do |char|
    index = current_letters_in_hand.find_index(char)
    # if index number is truthy, delete element at index
    if index
      current_letters_in_hand.delete_at(index)
      # if index number is falsey, return false
    else 
      return false
    end
  end
  # will return true if all indices are accounted for
  return true
end

# WAVE 3
def score_word(word)
  characters = word.upcase.split('')
  # if word length is greater than or equal to 7, score gains additional 8 points for word
  score = (characters.length >= 7) ? 8 : 0
  characters.each do |letter|
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
  return score
end

# WAVE 4
def highest_score_from(words)
  # map each word and score as key value pairs to an array (named results) of hashes
  results =  words.map { |word| { word: word, score: score_word(word)} }
  best_result = results.max_by { |obj| obj[:score] }
  
  high_scores = []
  results.each { |obj| high_scores << obj[:word] if obj[:score] == best_result[:score] }
  
  # save words with length of 10 to winner array
  winner = high_scores.select { |element| element.length == 10 }
  
  # if there are no words with length of 10, assign first, shortest word to winner variable 
  # if there are words with length of 10, assign first word to winner variable
  winner = winner.empty? ? high_scores.min_by { |element| element.length } : winner[0]
  
  return { word: winner, score: best_result[:score] }
end

# WAVE 5

def is_in_english_dict?(input)
  csv_from_file = CSV.read('assets/dictionary-english.csv').flatten

  return csv_from_file.include? input
end
