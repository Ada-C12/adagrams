# wave1 code
def draw_letters
  pool_of_letters = {
    "A" => 9, "B" => 2, "C" => 2, "D" => 4, "E" => 12, "F" => 2, "G" => 3, "H" => 2, "I" => 9, "J" => 1, "K" => 1, "L" => 4, "M" => 2, "N" => 6, "O" => 8, "P" => 2, "Q" => 1, "R" => 6, "S" => 4, "T" => 6, "U" => 4, "V" => 2, "W" =>2, "X" => 1, "Y" => 2, "Z" => 1
  }
  
  players_letters = []
  alphabet = ("A".."Z").to_a
  
  until players_letters.length == 10
    random_letter = alphabet.sample
    if pool_of_letters[random_letter] && pool_of_letters[random_letter] > 0
      players_letters << random_letter
      pool_of_letters[random_letter] -= 1
    end
  end
  
  return players_letters
end

# wave2 code


def uses_available_letters?(input, letters_in_hand)
  user_word = input.upcase.chars
  word_hash = {}
  user_word.each do |letter|
    if word_hash["#{letter}"].nil?
      word_hash["#{letter}"] = 1
    else
      word_hash["#{letter}"] += 1
    end
  end
  
  full_pile = {}
  letters_in_hand.each do |letter|
    if full_pile["#{letter}"].nil?
      full_pile["#{letter}"] = 1
    else
      full_pile["#{letter}"] += 1
    end
  end
  return word_hash.all? do |letter, count|
    full_pile.has_key?(letter) && (full_pile[letter] >= word_hash[letter])
  end
end

#Wave_3

def score_word(word)
  one_point_letter = %w[A E I O U L N R S T]
  two_point_letter = %w[D G]
  three_point_letter = %w[B C M P]
  four_point_letter = %w[F H V W Y]
  five_point_letter = %w[K]
  eight_point_letter = %w[J X]
  ten_point_letter = %w[Q Z]
  
  letters = word.upcase.chars
  total = 0
  letters.each do |score|
    if one_point_letter.include?(score)
      total += 1
    elsif two_point_letter.include?(score)
      total += 2
    elsif three_point_letter.include?(score)
      total += 3
    elsif four_point_letter.include?(score)
      total += 4
    elsif five_point_letter.include?(score)
      total += 5
    elsif eight_point_letter.include?(score)
      total += 8
    elsif ten_point_letter.include?(score)
      total += 10
    end
  end 
  
  extra_points = [7, 8, 9, 10]
  if extra_points.include?(letters.length)
    total += 8
  end
  return total
end

