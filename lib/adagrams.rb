# Adagrams - Week 2 - Ada Cohort 12
# Authors: Sara Baig & Farah Davoodi
# Date : August 14 2019

# Wave 1 Problem
require 'csv'

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
    
    # Wave 3 Problem
    def score_word(word)
        user_word = word.downcase.split('')
        total_score = 0
        user_word.each do |letter|
            case letter
            when 'a','e','i','o','u','l','n','r','s','t'
                total_score += 1
            when 'd','g'
                total_score += 2
            when 'b','c','m','p'
                total_score += 3
            when 'f','h','v','w','y'
                total_score += 4
            when 'k'
                total_score += 5
            when 'j','x'
                total_score += 8
            when 'q','z'
                total_score += 10
            end
        end
        
        if user_word.length > 6
            total_score += 8
        end
        
        return total_score
    end
    
    
    # Wave 4 Problem
    def highest_score_from(words)
        winning_word = {}
        
        max_word_score = 0
        max_word = ""
        winning_word_letter_count = 0
        
        words.each do |word|
            if score_word(word) > max_word_score
                max_word_score = score_word(word)
                max_word = word
                winning_word_letter_count = word.length
                
            elsif score_word(word) == max_word_score 
                if word.length == 10
                    max_word_score = score_word(word)
                    max_word = word
                    winning_word_letter_count = word.length
                elsif word.length < winning_word_letter_count
                    max_word_score = score_word(word)
                    max_word = word
                    winning_word_letter_count = word.length
                end
            end
        end
        
        
        winning_word = {
            word: max_word,
            score: max_word_score
        }
        return winning_word
    end
    
    # Wave 5 Problem
    def is_in_english_dict?(input)
        dictionary = (File.read("assets/dictionary-english.csv"))
        
        if dictionary.include?(input)
            return true
        else
            return false
        end
    end
    