require 'pry'
# require_relative '../assets/dictionary-english.csv' #for wave 5 

# wave 1

# draw_letters includes letter library due to scope since method is instructed to not require parameters
def draw_letters
  letters = [
    { character: "a", quantity: 9, score: 1 },
    { character: "b", quantity: 2, score: 3 },
    { character: "c", quantity: 2, score: 3 },
    { character: "d", quantity: 4, score: 2 },
    { character: "e", quantity: 12, score: 1 },
    { character: "f", quantity: 2, score: 4 },
    { character: "g", quantity: 3, score: 2 },
    { character: "h", quantity: 2, score: 4 },
    { character: "i", quantity: 9, score: 1 },
    { character: "j", quantity: 1, score: 8 },
    { character: "k", quantity: 1, score: 5 },
    { character: "l", quantity: 4, score: 1 },
    { character: "m", quantity: 2, score: 3 },
    { character: "n", quantity: 6, score: 1 },
    { character: "o", quantity: 8, score: 1 },
    { character: "p", quantity: 2, score: 3 },
    { character: "q", quantity: 1, score: 10 },
    { character: "r", quantity: 6, score: 1 },
    { character: "s", quantity: 4, score: 1 },
    { character: "t", quantity: 6, score: 1 },
    { character: "u", quantity: 4, score: 1 },
    { character: "v", quantity: 2, score: 4 },
    { character: "w", quantity: 2, score: 4 },
    { character: "x", quantity: 1, score: 8 },
    { character: "y", quantity: 2, score: 4 },
    { character: "z", quantity: 1, score: 10 },
  ]
  # letter_bucket creates an empty array that will be used to have a representative (gigantic) alphabet library
  letter_bucket = []
  letters.each do |letter|
    letter[:quantity].times do
      letter_bucket << letter[:character]
    end
  end
  # hand creates an empty array that will have 10 randomly drawn letters
  hand = []
  10.times do 
    hand << letter_bucket.slice(rand(0...letter_bucket.length)) 
  end
  # restores the "used" letters to letter_bucket so they are not "used up"
  letter_bucket << hand
  letter_bucket.flatten!.sort!
  return hand
end

# wave 2 
# iterate over user-provided input and hand dealt
# as the characters match, they are removed from each collection
def uses_available_letters?(input, letters_in_hand)
  input = input.split('')
  letters_in_hand.reject do |letter|
    if input.include?(letter)
      input.slice!(input.index(letter))
    end
  end
  # the length of the input checks that the user used only available letters
  if input.length == 0
    return true
  else
    return false
  end
end

# wave 3

# manipulate user input
def score_word (word)
  score = 0
  word = word.downcase
  word = word.split('')

  # award additional points per game rules
  if word.length >= 7 && word.length <= 10
    score =+ 8
  end

  # iterates over the input to assign score based on alphabet library
  letters = [
    { character: "a", quantity: 9, score: 1 },
    { character: "b", quantity: 2, score: 3 },
    { character: "c", quantity: 2, score: 3 },
    { character: "d", quantity: 4, score: 2 },
    { character: "e", quantity: 12, score: 1 },
    { character: "f", quantity: 2, score: 4 },
    { character: "g", quantity: 3, score: 2 },
    { character: "h", quantity: 2, score: 4 },
    { character: "i", quantity: 9, score: 1 },
    { character: "j", quantity: 1, score: 8 },
    { character: "k", quantity: 1, score: 5 },
    { character: "l", quantity: 4, score: 1 },
    { character: "m", quantity: 2, score: 3 },
    { character: "n", quantity: 6, score: 1 },
    { character: "o", quantity: 8, score: 1 },
    { character: "p", quantity: 2, score: 3 },
    { character: "q", quantity: 1, score: 10 },
    { character: "r", quantity: 6, score: 1 },
    { character: "s", quantity: 4, score: 1 },
    { character: "t", quantity: 6, score: 1 },
    { character: "u", quantity: 4, score: 1 },
    { character: "v", quantity: 2, score: 4 },
    { character: "w", quantity: 2, score: 4 },
    { character: "x", quantity: 1, score: 8 },
    { character: "y", quantity: 2, score: 4 },
    { character: "z", quantity: 1, score: 10 },
  ]
  word.each do |character|
    letters.each do |letter_ref|
      if character == letter_ref[:character]
        score = score + letter_ref[:score]
      end
    end
  end
  return score
end

# wave 4

def highest_score_from (words)
  
  #hash to be returned
  winning_hash = {
    :word => "",
    :score => 0
  }

  words.each do |word|

    wordscore = score_word(word)    

    if wordscore > winning_hash[:score]
      winning_hash[:word] = word
      winning_hash[:score] = wordscore

    elsif wordscore == winning_hash[:score]
      if word.length == 10 && winning_hash[:word].length != 10
        winning_hash[:word] = word
        winning_hash[:score] = wordscore  
      elsif word.length < winning_hash[:word].length && winning_hash[:word].length != 10
        winning_hash[:word] = word
        winning_hash[:score] = wordscore    
      end
    end
  end

return winning_hash

end

# wave 5

# checks to see if input is in English dictionary
def is_in_english_dict? (input) 
  path = '/Users/kelseykrippaehne/Documents/Ada/hw/adagrams/lib/dictionary-english.csv' # deliberate absolute path
  lower_case_input = input.downcase
  File.open(path) do |file|
    whole_dictionary = file.readlines
    if whole_dictionary.include? (lower_case_input +"\n")
      return true
    else
      return false
    end
  end
end
