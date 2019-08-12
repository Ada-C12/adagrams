
# letters = ["b", "b", "p", "p", "g", "g", "g", "d", "d", "d", "d"].shuffle
# # get 10 strings
# generate = []
# 10.times do
#   generate << letters.last
#   letters.pop
# end
# puts generate


# draw_letters

letter_v2 = {"9" => ["A", "I"], "4" => ["D", "L", "S", "U"]}
total_letters = []

letter_v2.each do |key, value|
  key_i = key.to_i
  key_i.times do
    value.each do |string|
      total_letters << string
    end
  end
  # end
end

print total_letters