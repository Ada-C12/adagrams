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


# Wave 2
def uses_available_letters(input, letters_in_hand)
  input_letters = input.split('').sort
  input_letters = input_letters.map {|letter| letter.upcase}
  puts input_letters
  letters_in_hand = letters_in_hand.sort
  if input_letters == letters_in_hand
    puts true
  else
    puts false
  end
end

uses_available_letters("ada", ["A","D","A"])