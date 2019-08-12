

def draw_letters 
    letters_pool = [("A " * 9).split, ("B " * 2).split, ("C " * 2).split, ("D " * 4).split, 
        ("E " * 12).split, ("F " * 2).split, ("G " * 3).split, ("H " * 2).split, 
        ("I " * 9).split, ("J " * 1).split, ("K " * 1).split, ("L " * 4).split, ("M " * 2).split, 
        ("N " * 6).split, ("O " * 8).split, ("P " * 2).split, ("Q " * 1).split, ("R " * 6).split, 
        ("S " * 4).split, ("T " * 6).split, ("U " * 4).split, ("V " * 2).split, ("W " * 2).split, 
        ("X " * 1).split, ("Y " * 2).split, ("Z " * 1).split].flatten
        
        hand = letters_pool.sample(10)
        return hand 
    end 
    
    
    
    