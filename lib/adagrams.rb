LETTER_POOL = {A: 9,	N: 6, B: 2,	O: 8, C: 2,	P: 2, D: 4,	Q: 1, E: 12, R: 6, F: 2, S: 4, G: 3,	T: 6, H: 2,	U: 4, I: 9,	V: 2, J: 1,	W: 2, K: 1,	X: 1, L: 4,	Y: 2, M: 2, Z: 1}


def draw_letters 
  letters = LETTER_POOL.map do |letter, count|
    Array.new(count, letter.to_s)
  end
  
  return letters.flatten.sample(10)
end

# method may change stings in letters_in_hand 
def uses_available_letters?(input, letters_in_hand)
  input.each_char do |c|
    index = letters_in_hand.find_index(c)
    if index.nil?
      return false
    else
      letters_in_hand.delete_at(index)
    end 
  end
return true
end

SCORE_CHART = [
  {
    letters: %w(A E I O U L N R S T),
    value: 1
  },
  { 
    letters: %w(D G),
    value: 2
  },
  {
    letters: %w(B C M P),
    value: 3
  },
  {
    letters: %w(F H V W Y),
    value: 4
  },
  {
    letters: %w(K),
    value: 5
  },
  {
    letters: %w(J K),
    value: 8
  },
  {
    letters: %w(Q Z),
    value: 10
  }
]

# refactor!
def score_word(word)
  total_points = 0
  word.each_char do |c|
    SCORE_CHART.each do |score|
      if score[:letters].include?(c)
        total_points += score[:value]
      end
    end
  end
  if word.length > 6
    total_points += 8
  end
  return total_points
end

