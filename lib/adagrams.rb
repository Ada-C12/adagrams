def draw_letters
  pool_of_letters = {
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
  
  players_letters = []
  alphabet = ("A".."Z").to_a
  until players_letters.length == 10
  random_letter = alphabet.sample.to_sym
    if pool_of_letters.include?(random_letter) && pool_of_letters[random_letter] > 0
      players_letters << random_letter.to_s
      pool_of_letters[random_letter] -= 1
    # 
    
    end
  end
  
  # until players_letters.length == 10
  #   alphabet = ("a".."z").to_a
  #   random_letter = alphabet.sample.upcase.to_sym
  
  #   while pool_of_letters[random_letter] > 0
  #     players_letters << random_letter
  #     pool_of_letters[random_letter] -= 1
  #   end

  #p pool_of_letters
  
  return players_letters
end
#end


#yasmin = draw_letters 
#p yasmin
#p yasmin.length