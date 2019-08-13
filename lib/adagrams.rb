# Ga-Young Jin, Raisah Vesteinsdottir Cohort 12
# Monday, August 12th, 2019
# Week 2, Adagram Project

# wave-1

SIZE_OF_HAND = 10

def draw_letters
  letter_dist = {  # given distribution of letters 
    A: 9,
    B: 2,
    C: 2,
    D: 4,
    E: 12,
    F: 2,
    G: 3,
    H: 2,
    I: 9, 
    J: 1,
    K: 1,
    L: 4,
    M: 2,
    N: 6,
    O: 8,
    P: 2,
    Q: 1,
    R: 6,
    S: 4,
    T: 6,
    U: 4,
    V: 2,
    W: 2,
    X: 1,
    Y: 2,
    Z: 1
  }
  
  # putting all available letters into one array
  all_letters = []
  
  letter_dist.each do |letter, quantity|
    quantity.times do
      all_letters << letter.to_s
    end
  end
  
  # create randomized hand
  shuffled_all_letters = all_letters.shuffle 
  hand = []
  
  SIZE_OF_HAND.times do |i|
    hand << shuffled_all_letters[i]
  end
  return hand
end

# wave-2
def uses_available_letters?(input, letters_in_hand)
  input_as_array = input.upcase.split("") 
  if input_as_array.length > letters_in_hand.length
    return false
  else
    input_as_array.each do |c|
      comparison = false
      index = 0
      while comparison == false
        if letters_in_hand[index] == c
          letters_in_hand.delete_at(index)
          comparison = true
        elsif index == letters_in_hand.length - 1
          comparison = true
        end
        index += 1
      end
    end
    if letters_in_hand.length == SIZE_OF_HAND - input_as_array.length
      return true
    else
      return false
    end
  end
end
# letters = ["A", "B", "C", "D", "E", "A"]
# string = "abz"

# puts uses_available_letters?(string, letters)
# print letters
