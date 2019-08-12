def draw_letter
  
  letter_bag = %w[a a a a a a a a a b b c c d d d d e e e e e e e e e e e e f f g g g h h i i i i i i i i i i j k l l l l m m n n n n n n o o o o o o o o o p p q r r r r r r r s s s s t t t t t t u u u u v v w w x y y z]
  letter_hand = letter_bag.sample(10)
  p letter_bag
  return letter_hand
  
end

p draw_letter


