def draw_letters()
  distribution = {
    A: ["A", "A", "A", "A", "A", "A", "A", "A", "A"],
    B: ["B", "B"],
    C: ["C", "C"],
    D: ["D", "D", "D", "D"],
    E: ["E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E", "E"],
    F: ["F", "F"],
    G: ["G", "G", "G"],
    H: ["H", "H"],
    I: ["I", "I", "I", "I", "I", "I", "I", "I", "I"],
    J: ["J"],
    K: ["K"],
    L: ["L", "L", "L", "L"],
    M: ["M", "M"],
    N: ["N", "N", "N", "N", "N", "N"],
    O: ["O", "O", "O", "O", "O", "O", "O", "O"],
    P: ["P", "P"],
    Q: ["Q"],
    R: ["R", "R", "R", "R", "R", "R"],
    S: ["S", "S", "S", "S"],
    T: ["T", "T", "T", "T", "T", "T"],
    U: ["U", "U", "U", "U"],
    V: ["V", "V"],
    W: ["W", "W"],
    X: ["X"],
    Y: ["Y", "Y"],
    Z: ["Z"]
  }
  
  # WAVE 1
  letters = distribution.values.flatten
  # array of 10 strings
  strings = []
  10.times do |index| 
    strings << letters.sample
    letters.shuffle!
  end
  
  return strings
end

# WAVE 2
def uses_available_letters?(input, letters_in_hand)
  current_letters_in_hand = letters_in_hand.dup
  # split user input into array of chars
  characters = input.upwhen.split('')
  characters.each do |char|
    index = current_letters_in_hand.find_index(char)
    if index
      current_letters_in_hand.delete_at(index)
    else 
      return false
    end
  end
  # letters_in_hand = current_letters_in_hand
  return true
end

