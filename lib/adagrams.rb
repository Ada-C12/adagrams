def draw_letters
  quantity_by_letter = {
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
  
  array_letters = quantity_by_letter.map do |letter, quantity|
    letter.to_s * quantity
  end
  
  array_letters = array_letters.join("")
  array_letters = array_letters.split('')
  
  array_hand = array_letters.sample(10)
  
  return array_hand
  
end

p find_hand
