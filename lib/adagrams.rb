def draw_letters
    letters_arr = []
    new_letters_arr = []
    letters_in_hand = []

    LETTERS.each do |letter, qty|
        qty.times do 
            letters_arr.push(letter.to_s)
        end
    end
        
    new_letters_arr = (0..(letters_arr.length - 1)).to_a
    pluck = 10
    pluck.times do 
        index = rand(0..(new_letters_arr.length-1))
        while !new_letters_arr.include?(index)
            index = rand(0..(new_letters_arr.length-1))
        end
        puts "#{letters_arr[index]}"
        letters_in_hand.push(letters_arr[index])
        new_letters_arr.delete(index)
    end
    return letters_in_hand
    end
    
def uses_available_letters? (input, letters_in_hand)
    input.split('').each do |tile|
        if letters_in_hand.include?(tile)
            index_of_tile = letters_in_hand.index(tile)
            letters_in_hand.delete_at(index_of_tile)
        else
            return false
        end
    end     
    return true
end    


LETTERS = {A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9, J: 1, K: 1, L: 4, M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1}

# puts letters

