def draw_letters
  # letters = Array.new
  # letters.fill("A", 0..8)
  # letters.fill("B", 9..10)
  # letters.fill("C", 11..12)
  # letters.fill("D", 13..16)
  # letters.fill("E", 17..28)
  # letters.fill("F", 29..30)
  # letters.fill("G", 31..33)
  # letters.fill("H", 34..35)
  # letters.fill("I", 36..44)
  # letters.fill("J", 45..45)
  # letters.fill("K", 46..46)
  # letters.fill("L", 47..50)
  # letters.fill("M", 51..52)
  # letters.fill("N", 53..58)
  # letters.fill("O", 59..66)
  # letters.fill("P", 67..68)
  # letters.fill("Q", 69..69)
  # letters.fill("R", 70..75)
  # letters.fill("S", 76..79)
  # letters.fill("T", 80..85)
  # letters.fill("U", 86..89)
  # letters.fill("V", 90..91)
  # letters.fill("W", 92..93)
  # letters.fill("X", 94..94)
  # letters.fill("Y", 95..96)
  # letters.fill("Z", 97..97)
  all_letters_hash = {
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
  
  all_letters_array = Array.new
  all_letters_hash.each do |letter, number|
    number.times do
      all_letters_array << letter
    end
  end
  
  
  
  letters_in_hand = all_letters_array.sample(10)
  p all_letters_array
  p letters_in_hand
end

draw_letters

#def uses_available_letters?(input, letters_in_hand)

