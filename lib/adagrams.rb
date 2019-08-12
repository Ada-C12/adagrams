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
