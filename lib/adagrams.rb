
# letter_pool = %w(a a a a a a a a a b b c c d d d d e e e e e e e e e e e e f f g g g h h i i i i i i i i i j k l l l l m m n n n n n n o o o o o o o o p p q r r r r r r s s s s t t t t t t u u u u v v w w x y y z)

# remaining_pool = %w(a a a a a a a a a b b c c d d d d e e e e e e e e e e e e f f g g g h h i i i i i i i i i j k l l l l m m n n n n n n o o o o o o o o p p q r r r r r r s s s s t t t t t t u u u u v v w w x y y z)

# # user_hand = letter_pool.sample(10)

# # p user_hand

# user_hand = []
# # randomize remaining_pool and assign randomized pool to new variable shuffled_remaining_pool
# # shuffled_remaining_pool = remaining_pool.shuffle
# # p shuffled_remaining_pool

# 10.times do |letter|
#   letter = remaining_pool.sample
#   user_hand.push(letter)
#   remaining_pool.slice!(remaining_pool.index(letter))
# end 
# p user_hand
# p remaining_pool


# Note from Julia: per the specs, the user hand needs to have capital letters
# Sample code using map! to upcase
# array = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
# array.map!(&:upcase)
# array
# => ["MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY"]

def draw_letters
  remaining_pool = %w(a a a a a a a a a b b c c d d d d e e e e e e e e e e e e f f g g g h h i i i i i i i i i j k l l l l m m n n n n n n o o o o o o o o p p q r r r r r r s s s s t t t t t t u u u u v v w w x y y z)
  remaining_pool.map!(&:upcase)
  user_hand = []
  
  10.times do |letter|
    letter = remaining_pool.sample
    user_hand.push(letter)
    remaining_pool.slice!(remaining_pool.index(letter))
  end 
  p remaining_pool
  return user_hand
  
end 

result = draw_letters
p result 
