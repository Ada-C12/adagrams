# require pry
# letter_pool = %w(a a a a a a a a a b b c c d d d d e e e e e e e e e e e e f f g g g h h i i i i i i i i i j k l l l l m m n n n n n n o o o o o o o o p p q r r r r r r s s s s t t t t t t u u u u v v w w x y y z)

# def draw_letters
#   remaining_pool = %w(a a a a a a a a a b b c c d d d d e e e e e e e e e e e e f f g g g h h i i i i i i i i i j k l l l l m m n n n n n n o o o o o o o o p p q r r r r r r s s s s t t t t t t u u u u v v w w x y y z)
#   remaining_pool.map!(&:upcase)
#   letters_in_hand = []

#   10.times do |letter|
#     letter = remaining_pool.sample
#     letters_in_hand.push(letter)
#     remaining_pool.slice!(remaining_pool.index(letter))
#   end 
#   p remaining_pool
#   return letters_in_hand
# end 

# result = draw_letters
# p result 

# def uses_available_letters(input, letters_in_hand)
#   print "Please enter a word: "
#   input = "Hello"
#   binding.pry
#   input_array = input.chars

#   input_array.each do |letter|
#     if letters_in_hand.include?(letter) 
#       match = "true"
#     else 
#       match = "false"
#     end
#   end 
#   return match
# end 

# test = uses_available_letters(input, letters_in_hand)
# puts test

remaining_pool = %w(a a a a a a a a a b b c c d d d d e e e e e e e e e e e e f f g g g h h i i i i i i i i i j k l l l l m m n n n n n n o o o o o o o o p p q r r r r r r s s s s t t t t t t u u u u v v w w x y y z)
remaining_pool.map!(&:upcase)
letters_in_hand = []

10.times do |letter|
  letter = remaining_pool.sample
  letters_in_hand.push(letter)
  remaining_pool.slice!(remaining_pool.index(letter))
end 

p letters_in_hand


print "Please enter a word: "
input = gets.chomp.upcase
input_array = input.chars

input_array.each do |letter|
  if letters_in_hand.include?(letter) 
    puts true
  else 
    puts false
  end
end 