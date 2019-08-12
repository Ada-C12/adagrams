def draw_letters(letter_pool)
  letters = []
  
  letter_pool.each do |key, value|
    key_i = key.to_i
    key_i.times do
      value.each do |string|
        letters << string
      end
    end
  end
  
  generate = []
  10.times do
    generate << letters.last
    letters.pop
  end
  return generate
  
end


letter_v2 = {"9" => ["A", "I"], "4" => ["D", "L", "S", "U"]}
print draw_letters(letter_v2)