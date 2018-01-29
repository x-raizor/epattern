// Every Pixel Pattern Class
 
class EPattern {
    int fillin_pixels_amount, element_size, pixels_size, pixels_gap;
    ArrayList<PVector> pixels_coordinates;
    boolean regenerateInEveryDraw;
  
    EPattern(int fillin_pixels_amount, 
             int element_size, 
             int pixels_size, 
             int pixels_gap,
             boolean regenerateInEveryDraw) 
    {
      this.fillin_pixels_amount = fillin_pixels_amount;
      this.element_size = element_size; // pixels in side
      this.pixels_size = pixels_size;  // pixel size
      this.pixels_gap = pixels_gap;  // pixel distance    
      this.pixels_coordinates = new ArrayList<PVector>();
      this.regenerateInEveryDraw = regenerateInEveryDraw;
      generate_element();
    }

    void apply_style() 
    {
        noStroke();
        fill(0);
    }
        
    int get_size() 
    {
        int _size = element_size * (pixels_size + pixels_gap);
        return(_size);
    }    
        
    void generate_element() 
    {
        pixels_coordinates = new ArrayList<PVector>();
        for (int i = 0; i < fillin_pixels_amount; i++)
        {
            int _x = int(random(0, element_size));
            int _y = int(random(0, element_size));
            int x = _x * (pixels_size + pixels_gap);
            int y = _y * (pixels_size + pixels_gap);
            pixels_coordinates.add(new PVector(x, y));
        }

    }
                    
    void draw_element(int element_index)
    {
        ArrayList<PVector> coordinates = transform_coord(element_index);
        for (PVector point : coordinates) {
            rect(point.x, point.y, pixels_size, pixels_size);
        }
    }
    
    
    ArrayList<PVector> transform_coord(int element_index)
    // Mapping for 4 elements in quad
    {
        int side = get_size();
        ArrayList<PVector> new_coords = new ArrayList<PVector>();
        
        if (element_index == 0) 
        {
            return(pixels_coordinates);
        }   
        else if (element_index == 1) 
        {
            for (PVector point : pixels_coordinates) 
            {
                int _x = 2 * side - int(point.x) - pixels_size - pixels_gap;
                int _y = int(point.y);
                new_coords.add(new PVector(_x, _y));
            }
        }
        else if (element_index == 2)
        {
            for (PVector point : pixels_coordinates) 
            {
                int _x = 2*side - int(point.x) - pixels_size - pixels_gap;
                int _y = 2*side - int(point.y) - pixels_size - pixels_gap;
                new_coords.add(new PVector(_x, _y));
            }
        }
        else
        {
            for (PVector point : pixels_coordinates) 
            {
                int _x = int(point.x);
                int _y = 2*side - int(point.y) - pixels_size - pixels_gap;
                new_coords.add(new PVector(_x, _y));
             }
        }
        return(new_coords);
      }    
    
    void plot()
    {
        pushMatrix();
        
        if (regenerateInEveryDraw)
          generate_element();
        
        apply_style();
        draw_element(0);
        draw_element(1);
        draw_element(2);
        draw_element(3);
        
        popMatrix();
    }

}