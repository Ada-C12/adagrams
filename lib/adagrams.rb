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

def users_available_letters?(input, letters_in_hand) 
  #puts letters_in_hand
  def users_available_letters?(input, letters_in_hand)
    input.each do |char|
      if !letters_in_hand.include?(char)
        puts “this didn’t work”
        return false
      end
      letters_in_hand.delete_at(letters_in_hand.index(char))
    end
    p letters_in_hand
    return true
  end
  
  puts “Enter a word.”
  user_word = gets.chomp.upcase
  word_array = user_word.chars
  
  users_available_letters?(word_array, hand)
  
  # def score_word(word)
  # score_chart = {%w[A E I O U L N R S T] => 1, %w[D G] => 2, %w[B C M P] => 3, %w[F H B W Y] => 4, %w[K] => 5, %w[J X]=> 8, %w[Q Z] => 10}
  
  
  
  