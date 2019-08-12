####################### WAVE 1 ##########################
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

# letters_in_hand = draw_letters
# p letters_in_hand




####################### WAVE 2 ##########################
# print "Give me a word: "
# input = gets.chomp.upcase

def uses_available_letters?(input, letters_in_hand)

  # split input into individual letters
  input_array = input.split(//)

  if input.length > letters_in_hand.length
    # puts "Your word is too long!"
    return false
  elsif input.length == 0
    # we might give u a 2nd chance later
    # print "You didn't give me a word!"
    return false
  end

  # check letters against letters_in_hand
  input_array.length.times do |index|
    if letters_in_hand.include? input_array[index]
      garbage_index = letters_in_hand.rindex(input_array[index])
      letters_in_hand.delete_at(garbage_index)
    else
      # puts "Letter #{input_array[index]} is not in your hand!"
      return false
    end       
  end

  return true
end

# p uses_available_letters?(input, letters_in_hand)




####################### WAVE 3 ##########################