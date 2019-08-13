# Adagrams - Week 2 - Ada Cohort 12
# Authors: Sara Baig & Farah Davoodi

# Wave 1 Problem
def draw_letters ()
    alphabet = 
    {
    'a'=> 9,
    'b'=> 2,
    'c'=> 2,
    'd'=> 4,
    'e'=> 12,
    'f'=> 2,
    'g'=> 3,
    'h'=> 2,
    'i'=> 9,
    'j'=> 1,
    'k'=> 1,
    'l'=> 4,
    'm'=> 2,
    'n'=> 6,
    'o'=> 8,
    'p'=> 2,
    'q'=> 1,
    'r'=> 6,
    's'=> 4,
    't'=> 6,
    'u'=> 4,
    'v'=> 2,
    'x'=> 1,
    'y'=> 2,
    'z'=> 1 }
    
    
    all_letters= []
    
    alphabet.each do |letter, quantity|
        letters = []
        i = 0
        while i < quantity
            letters << letter
            i += 1
        end
        all_letters << letters
    end
    
    all_letters = all_letters.flatten
    
    all_letters.shuffle!
    your_letters = []
    i = 0
    while i < 10
        your_letters << all_letters[i]
        i += 1
    end
    
    return your_letters
end

# Wave 2 Problem
def uses_available_letters?(input, letters_in_hand)
    
    word = input.downcase.split('')
    same_letters = letters_in_hand.shuffle

    word.each do |letter|
        if same_letters.include?(letter)
            letter_location = same_letters.index(letter)
            same_letters.delete_at(letter_location)
        else
            return false
        end
    end
    
end




