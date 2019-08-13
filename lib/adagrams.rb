# Wave 1
def draw_letters
  letter_pool = {
    "9" => ["A", "I"], 
    "4" => ["D", "L", "S", "U"], 
    "2" => ["B", "C", "F", "H", "M", "P", "V", "W", "Y"],  
    "12" => ["E"],  
    "3" => ["G",],
    "1" => ["J", "K", "Q", "X", "Z"],
    "6" => ["N", "R", "T"],
    "8" => ["O"],
  }
  
  letters = []
  
  letter_pool.each do |key, value|
    key_i = key.to_i
    key_i.times do
      value.each do |string|
        letters << string
      end
    end
  end
  
  generate = []
  10.times do
    generate << letters.shuffle.last
    letters.pop
  end
  return generate
end

# require 'pry'

# Wave 2
def uses_available_letters?(test_word, drawn_letters)
  
  a = drawn_letters
  drawn_letters_2 = a
  input_letters = test_word.split('')
  input_letters = input_letters.map {|letter| letter.upcase}
  # binding.pry
  input_letters.each do |letter|
    index = drawn_letters_2.index(letter)
    if index != nil
      drawn_letters_2.delete_at(index)
    else
      return false
    end
  end
  return true
end


puts uses_available_letters?("kada", ["A","D","A","C","K"])


# Wave 3
def score_word(word)
  score_chart = {
    "1" => ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
    "2" => ["D", "G"],
    "3" => ["B", "C", "M", "P"],
    "4" => ["F", "H", "V", "W", "Y"],
    "5" => ["K"],
    "8" => ["J", "X"],
    "10" => ["Q", "Z"]
  }
  
end