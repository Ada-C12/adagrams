# Wave 1 - 10 letters (each letter is a string) for players hand
def draw_letters
  letters = {
    "A" => 9,
    "B" => 2,
    "C" => 2,
    "D" => 4, 
    "E" => 12, 
    "F" => 2,
    "G" => 3, 
    "H" => 2,
    "I" => 9, 
    "J" => 1,
    "K" => 1,
    "L" => 4,
    "M" => 2,
    "N" => 6,
    "O" => 8,
    "P" => 2,
    "Q" => 1,
    "R" => 6,
    "S" => 4,
    "T" => 6,
    "U" => 4,
    "V" => 2,
    "W" => 2,
    "X" => 1,
    "Y" => 2,
    "Z" => 1 
  }

  keys_only = letters.keys
  copy_of_letters = letters
  hand = []

  while hand.length < 10
    tile =  keys_only.sample
    tile_count = copy_of_letters["#{tile}"]
    # puts tile + tile_count.to_s
    if tile_count > 0
      copy_of_letters["#{tile}"] -= 1
      # puts copy_of_letters["#{tile}"]
      hand.push(tile)
    end
  end

  puts "HERE THE HAND"
  puts hand
  puts copy_of_letters
  return hand
end 
user_hand = draw_letters

# Wave 2
puts "Wave 2"
puts "Give me a word"
word = gets.chomp

def uses_available_letters(input, letters_in_hand)

  letters_array = input.split("")
  puts letters_array

  letters_array.each do |letter|
    if letters_in_hand.include?(letter) == false
      puts false 
    else puts true
    end 
  end 
end

uses_available_letters(word, user_hand)