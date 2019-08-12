# Wave 1
def draw_letters
  
  all_tiles = { 
    A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9,  J: 1, K: 1, L: 4, M: 2, 
    N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1 
  }
  
  tile_array = []
  
  all_tiles.each do |letter, number|
    number.times do 
      tile_array.push(letter.to_s)
    end
  end
  
  user_hand = tile_array.sample(10)
  return user_hand    
end

def uses_available_letters?(input, letters_in_hand)
  user_string = input.upcase
  letters_to_check = letters_in_hand.dup
  user_string.length.times do |num|
    tile_position = letters_to_check.index(user_string[num])
    if !tile_position
      return false
    else
      letters_to_check.delete_at(tile_position)
    end
  end
  return true
end