require 'csv'
DICTIONARY = CSV.read('assets/dictionary-english.csv')

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
    letters_in_hand_copy = []
    letters_in_hand_copy += letters_in_hand
    p letters_in_hand_copy
    input.split('').each do |tile|
        if letters_in_hand_copy.include?(tile)
            index_of_tile = letters_in_hand_copy.index(tile)
            letters_in_hand_copy.delete_at(index_of_tile)
        else
            return false
        end
    end     
    return true
end    

def score_word(word)
    score = 0
    word.upcase.split('').each do |letter|
        case letter
        when "A", "E", "I", "O", "U", "L", "N", "R", "S", "T"
            score += 1
        when "D", "G"
            score += 2
        when "B", "C", "M", "P"
            score += 3
        when "F", "H", "V", "W", "Y"
            score += 4
        when "K"
            score += 5
        when "J", "X"
            score += 8
        when "Q", "Z"
            score += 10
        end
    end
    if word.length>=7 && word.length<=10
        score += 8
    end
    
    return score
end

def highest_score_from(words)
    words_scores = {}
    words.each do |word|
        score = score_word(word)
        if !words_scores[score]
            words_scores[score] = [word]
        else
            words_scores[score].push(word)
        end
    end
    highest_scores = words_scores[words_scores.keys.max]
    # check length = 10 first
    
    # find the shortest words
    
    
    highest_scores.each do |word|
        if word.length == 10
            return {word: word, score: words_scores.keys.max}
        end
    end
    shortest_word = highest_scores.min_by { |word| word.length }
    return {word: shortest_word, score: words_scores.keys.max}
    # if multiple words, return first one
end



# uses_available_letters?('ABCD',["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"])
# POINTS = 
# {1: %w[A E I O U L N R S T],
# 2: %w[D G], 
# 3: %w[B C M P], 
# 4: %w[F H V W Y], 
# 5: %w[K], 
# 8: %w[J X],
# 10: %w[Q Z]}
LETTERS = {A: 9, B: 2, C: 2, D: 4, E: 12, F: 2, G: 3, H: 2, I: 9, J: 1, K: 1, L: 4, M: 2, N: 6, O: 8, P: 2, Q: 1, R: 6, S: 4, T: 6, U: 4, V: 2, W: 2, X: 1, Y: 2, Z: 1}

# puts letters

def is_in_english_dict?(input)
    return DICTIONARY.include?([input.downcase]) ? true : false
end
