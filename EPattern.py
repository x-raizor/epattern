
# Every Pixel Pattern Class
 
class EPattern:
    
    def __init__(self, fillin_pixels_amount=10, element_size=5, pixels_size=4, pixels_gap=2):        
        self.fillin_pixels_amount = int(fillin_pixels_amount)
        self.element_size = element_size # pixels in side
        self.pixels_size = pixels_size  # pixel size
        self.pixels_gap = pixels_gap  # pixel distance    
        self.pixels_coordinates = []
    

    def apply_style(self):
        noStroke()
        fill(0)
        
        
    def get_size(self):
        _size = self.element_size * (self.pixels_size + self.pixels_gap)
        return(_size)
        
        
    def generate_element(self):
        self.pixels_coordinates = []
        for _ in range(self.fillin_pixels_amount):
            _x = int(random(0, self.element_size))
            _y = int(random(0, self.element_size))
            x = _x * (self.pixels_size + self.pixels_gap)
            y = _y * (self.pixels_size + self.pixels_gap)
            self.pixels_coordinates.append((x, y))
    
                    
    def draw_element(self, element_index):
        coordinates = self.transform_coord(element_index)
        for x, y in coordinates:
            rect(x, y, self.pixels_size, self.pixels_size)        
    
    
    # mapping for 4 elements in quad
    def transform_coord(self, element_index):
        
        side = self.get_size()
        new_coords = []
        
        if element_index == 0: 
            return(self.pixels_coordinates)
        elif element_index == 1:
            for x, y in self.pixels_coordinates:
                _x = 2*side - x - self.pixels_size - self.pixels_gap
                _y = y
                new_coords.append((_x, _y))
        elif element_index == 2:
            for x, y in self.pixels_coordinates:
                _x = 2*side - x - self.pixels_size - self.pixels_gap
                _y = 2*side - y - self.pixels_size - self.pixels_gap
                new_coords.append((_x, _y))
        else:
            for x, y in self.pixels_coordinates:
                _x = x
                _y = 2*side - y - self.pixels_size - self.pixels_gap
                new_coords.append((_x, _y))
        return(new_coords)
        
    
    def plot(self):
        pushMatrix()
        self.apply_style()
        self.generate_element()
                
        self.draw_element(0)
        self.draw_element(1)
        self.draw_element(2)
        self.draw_element(3)
        
        popMatrix()