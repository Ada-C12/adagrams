# pseudocode

# data structure
#   array
#     one hash for each letter
#       contains key/value pairs for letter, quantity, and score value.

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
# fills the letter bucket
def fills_letter_bucket (letters)
  letter_bucket = []
  letters.each do |letter|
    letter[:quantity].times do
      letter_bucket << letter[:character]
    end
  end
 return letter_bucket
end

# calls method to fill the bucket
bucket = fills_letter_bucket (letters)

# populates letters in a hand "non destructively"
def gets_new_hand (hand, bucket)
  hand = []
  10.times do 
    hand << bucket.slice(rand(0...bucket.length)) # is destructive, but we fix it soon
  end
  bucket << hand # returns the "used" letters to the original bucket
  bucket.flatten!.sort! # makes the bucket pretty again
  return hand
end

def input_validation (word, hand)
  eval = nil
  until eval == "pass"
    hand.reject do |character|
      if word.include?(character)
        word.slice!(word.index(character))
      end
    end
    if word.length > 0
      puts "You do not have the letters in your hand for this word. Here are the letters available: #{hand} Try again: "
      word = gets.chomp
    else
      eval = "pass"
    end
  end

return word

end

letters_in_hand = gets_new_hand(letters_in_hand, bucket)
puts "#{letters_in_hand}"

puts "Hello user, here are the letters available to you: #{letters_in_hand}"
print "Please enter your word: "
guess = gets.chomp.downcase

input = input_validation(guess, letters_in_hand) #calls input validation

puts "I am the valid input, yay! #{input}"







# Can the user skip? If so, can they get new letters? 
















