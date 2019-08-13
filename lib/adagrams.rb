#Pool of Letters: HASH, not changeable. Where we are grabbing letters.

LETTER_POOL = {
    'A' => 9, 'B' => 2, 'C' => 2, 'D'=> 4, 'E'=> 12, 'F'=> 2, 'G'=> 3, 'H' =>2, 'I'=> 9, 'J'=> 1, 'K'=>1, 'L'=>4, 
    'M' => 2, 'N' => 6, 'O'=> 8, 'P'=> 2, 'Q'=> 1, 'R'=> 6, 'S'=> 4, 'T'=> 6, 'U'=> 4, 'V' => 2, 'W' => 2, 
    'X' => 1, 'Y'=> 2, 'Z'=> 1 
}


def draw_letters
    all_letters = []
    LETTER_POOL.each do |letter, amount|
        letters = []
        i = 0
        while (i < amount) do
            letters << letter
            i += 1
        end
        all_letters << letters
    end
    all_letters = all_letters.flatten
    
    # Creation of Hand ====> Create a method here so you can call it later in the program
    hand = []
    10.times do 
        hand << all_letters.sample
    end
    return hand
    
end