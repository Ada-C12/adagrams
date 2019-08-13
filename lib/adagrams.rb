# This is our data structure (bear with us until line 80)
pool = []
9.times do
  pool << "A"
end
2.times do
  pool << "B"
end
2.times do
  pool << "C"
end
4.times do
  pool << "D"
end
12.times do
  pool << "E"
end
2.times do
  pool << "F"
end
3.times do
  pool << "G"
end
2.times do
  pool << "H"
end
9.times do
  pool << "I"
end
1.times do
  pool << "J"
end
1.times do
  pool << "K"
end
4.times do
  pool << "L"
end
2.times do
  pool << "M"
end
6.times do
  pool << "N"
end
8.times do
  pool << "O"
end
2.times do
  pool << "P"
end
1.times do
  pool << "Q"
end
6.times do
  pool << "R"
end
4.times do
  pool << "S"
end
6.times do
  pool << "T"
end
4.times do
  pool << "U"
end
2.times do
  pool << "V"
end
2.times do
  pool << "W"
end
1.times do
  pool << "X"
end
2.times do
  pool << "Y"
end
1.times do
  pool << "Z"
end


# copy of original array to edit in program
current_pool = pool

# create method to draw new hand/aka letter choice
def draw_letters(array)
  array.sample(10)
end

# draw letters from current pool until pool is empty/not enough letters for next hand
n = 1
(current_pool.length/10).times do
  hand_n = draw_letters(current_pool)
  p hand_n
  n += 1
end