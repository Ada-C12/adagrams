
# wave_1
def draw_letters
  raw_tiles = [
    {letter: "A", weight: 9, score: 1},
    {letter: "B", weight: 2, score: 3},
    {letter: "C", weight: 2, score: 3},
    {letter: "D", weight: 4, score: 2},
    {letter: "E", weight: 12, score: 1},
    {letter: "F", weight: 2, score: 4},
    {letter: "G", weight: 3, score: 2},
    {letter: "H", weight: 2, score: 4},
    {letter: "I", weight: 9, score: 1},
    {letter: "J", weight: 1, score: 8},
    {letter: "K", weight: 1, score: 5},
    {letter: "L", weight: 4, score: 1},
    {letter: "M", weight: 2, score: 3},
    {letter: "N", weight: 6, score: 1},
    {letter: "O", weight: 8, score: 1},
    {letter: "P", weight: 2, score: 3},
    {letter: "Q", weight: 1, score: 10},
    {letter: "R", weight: 6, score: 1},
    {letter: "S", weight: 4, score: 1},
    {letter: "T", weight: 6, score: 1},
    {letter: "U", weight: 4, score: 1},
    {letter: "V", weight: 2, score: 4},
    {letter: "W", weight: 2, score: 4},
    {letter: "X", weight: 1, score: 8},
    {letter: "Y", weight: 2, score: 4},
    {letter: "Z", weight: 1, score: 10}]

    tile_set = []

    # extracts letter and score keys and puts them in array called raw_tiles
    raw_tiles.each do |a|
      a[:weight].times do
        tile_set.push(a[:letter])
      end
    end

    # extracts 10 random letters and assigns them to the array named hand 
    hand = tile_set.sample(10)
    return hand   
  end

  #Official hand

  letters_in_hand = draw_letters

  #Wave 2

  #Word is changed to array so we can see if the word is an anagram of the hand

  def uses_available_letters?(input, letters_in_hand)
    input = input.upcase.chars
    boolean_value = true
    input.each do |letter|
      if input.count(letter) > letters_in_hand.count(letter) 
        boolean_value = false
      end 
    end
    boolean_value
  end 

# Wave 3
# Return the score of the given word

def score_word(word)
  word = word.upcase.chars
  sum = 0
  total_sum = 0

  score_hash = {1=> ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"], 2=> ["D", "G"], 
  3=> ["B", "C", "M", "P"], 4=> ["F", "H", "V", "W", "Y"], 5=> ["K"], 8=> ["J", "X"], 
  10=> ["Q", "Z"]}
  
  total_sum = 8 if word.length >= 7 
  word.each do |letter|
    score_hash.each do |key, value|
      value.each do |check|
        if check == letter
          sum = key.to_i
          print sum 
          total_sum += sum
        end
      end
    end
  end
  return total_sum
end 







 
 

 
 
 
  

