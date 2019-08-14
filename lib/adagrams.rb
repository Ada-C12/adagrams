require "json"

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
  
  letters = []
  distribution.each do |letter, quantity|
    quantity.times { letters << letter.to_s }
  end
  
  strings = []
  10.times do
    letters.shuffle!
    strings << letters.pop
  end
  
  return strings
end

# WAVE 2
def uses_available_letters?(input, letters_in_hand)
  current_letters_in_hand = letters_in_hand.dup
  # split user input into array of chars
  characters = input.upcase.split('')
  characters.each do |char|
    index = current_letters_in_hand.find_index(char)
    if index
      current_letters_in_hand.delete_at(index)
    else 
      return false
    end
  end
  # letters_in_hand = current_letters_in_hand
  return true
end

# WAVE 3
def score_word(word)
  characters = word.split('')
  # give additional 8 points for word if its length is 7 to 10
  score = (characters.length >= 7) ? 8 : 0
  characters.each do |letter|
    case letter.upcase
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
  results =  words.map {|word| { word: word, score: score_word(word)} }
  best_result = results.max_by { |obj| obj[:score]}
  high_scores = []
  results.each do |obj|  
    if obj[:score] == best_result[:score] 
      high_scores << obj[:word]
    end
  end
  
  winner = high_scores.select { |element| element.length == 10}
  if !winner.empty?
    winner = winner[0]
  else
    winner = high_scores.min_by { |element| element.length }
  end
  return { word: winner, score: best_result[:score] }
end

# WAVE 5

def is_in_english_dict?(input)
  json_from_file = File.read('./lib/words_dictionary.json')
  words = JSON.parse(json_from_file)
  
  return words.has_key?(input)
end
