# preliminary set up
letters = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z]
freq = %w[9 2 2 4 12 2 3 2 9 1 1 4 2 6 8 2 1 6 4 6 4 2 2 1 2 1]

freq = freq.map do |number_string|
    number_string.to_i
end

# Assemble fresh new bag of tiles
PILE = []
letters.length.times do |index|
    freq[index].times do
        PILE << letters[index]
    end
end


def draw_letters
    return PILE.sample(10)
end

p1_tiles = draw_letters
p p1_tiles