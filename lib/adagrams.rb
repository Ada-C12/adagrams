def draw_letters
  all_letters = []
  alphabet = {“A”: 9, “B”: 2, “C”:2, “D”: 4, “E”: 12, “F”: 2, “G”: 3, “H”: 2, “I”: 9, “J”: 1, “K”: 1, “L”: 4, “M”: 2, “N”: 6, “O”: 8, “P”: 2, “Q”: 1, “R”: 6, “S”: 4, “T”: 6, “U”: 4, “V”: 2, “W”: 2, “X”: 1, “Y”: 2, “Z”: 1}
  alphabet.each do |letter, quantity|
    letters = []
    count = 0
    while (count < quantity)
      letters << letter.to_s
      count += 1
    end
    all_letters << letters
    all_letters = all_letters.flatten
  end
  user_hand = all_letters.sample(10)
  return user_hand
end

hand = draw_letters
p hand

#WAVE 2
def users_available_letters?(input, letters_in_hand)
  input.each do |char|
    if !letters_in_hand.include?(char)
      puts "This didn't work."
      return false
    end
    letters_in_hand.delete_at(letters_in_hand.index(char))
  end
  p letters_in_hand
  return true
end

puts "Enter a word."
user_word = gets.chomp.upcase
word_array = user_word.chars

users_available_letters?(word_array, hand)

#WAVE 3
def score_word(word)
  score_chart = {"A" => 1, "E" => 1, "I" => 1, "O" => 1, "U" => 1, "L" => 1, "N" => 1, "R" => 1, "S" => 1, "T" => 1, "D" => 2, "G" => 2, "B" => 3, "C" => 3, "M" => 3, "P" => 3, "F" => 4, "H" => 4, "V" => 4, "W" => 4, "Y" => 4, "K" => 5, "J" => 8, "X" => 8, "Q" => 10, "Z" => 10}
  score = 0
  if word.length >= 7
    score = 8
  end
  word.each do |char|
    points = score_chart[char]
    points = points.to_i
    score += points
  end
  p score
end

score_word(word_array)