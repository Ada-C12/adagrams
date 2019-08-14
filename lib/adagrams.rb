require 'pry'
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
  letter_bucket = []
  letters.each do |letter|
    letter[:quantity].times do
      letter_bucket << letter[:character]
    end
  end
  hand = []
  10.times do 
    hand << letter_bucket.slice(rand(0...letter_bucket.length)) 
  end
  letter_bucket << hand # restores the "used" letters to the bucket so they are not "used up"
  letter_bucket.flatten!.sort!

return hand
end

# wave 2 - validates user's inputted word
def uses_available_letters?(input, letters_in_hand)
  letters_in_hand.reject do |letter|
    if input.include?(letter)
      input.slice!(input.index(letter))
    end
  end
  if input.length <= 0
    return true
  else
    return false
  end
end

# wave 3

def score_word (word) # word is a string of characters
  score = 0
  word = word.downcase
  puts word
  awesome = word.split(//)
  binding.pry
  if awesome.length >= 7 && awesome.length <= 10
    score =+ 8
  end

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
  awesome.each do |character|
    letters.each do |letter_ref|
      if character == letter_ref[:character]
        score = score + letter_ref[:score]
      end
    end
  end

  return score #returns an integer that represents the score
end

# LETS TROUBLESHOOT FROM HERE TOMORROW!!!