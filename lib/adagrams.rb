
letters = ["b", "b", "p", "p", "g", "g", "g", "d", "d", "d", "d"].shuffle
# get 10 strings
generate = []
10.times do
  generate << letters.last
  letters.pop
end
puts generate


draw_letters