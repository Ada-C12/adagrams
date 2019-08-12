def draw_letters
  raw_tiles = [{letter: "A", weight: 9}, {letter: "B", weight: 2}, {letter: "C", weight: 2}, 
  {letter: "D", weight: 4}, {letter: "E", weight: 12}, {letter: "F", weight: 2}, {letter: "G", weight: 3}, 
  {letter: "H", weight: 2}, {letter: "I", weight: 9}, {letter: "J", weight: 1}, {letter: "K", weight: 1}, 
  {letter: "L", weight: 4}, {letter: "M", weight: 2}, {letter: "N", weight: 6}, {letter: "O", weight: 8}, 
  {letter: "P", weight: 2}, {letter: "Q", weight: 1}, {letter: "R", weight: 6}, {letter: "S", weight: 4}, 
  {letter: "T", weight: 6}, {letter: "U", weight: 4}, {letter: "V", weight: 2}, {letter: "W", weight: 2}, 
  {letter: "X", weight: 1}, {letter: "Y", weight: 2}, {letter: "Z", weight: 1}]
 tile_set = []

 raw_tiles.each do |a|
   a[:weight].times do
     tile_set.push(a[:letter])
   end
 end

 hand_array = []
 hand = tile_set.sample(10)
 hand_array = hand.join(" ")
 return hand_array
 end

 print draw_letters