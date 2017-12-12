
# ~·~·~·~·~·~·~·~·~·~·~·
# Every Pixel pattern
# Code by Andrew Shapiro
# ~·~·~·~·~·~·~·~·~·~·~·

from EPattern import EPattern 

def setup():
    size(300, 300)
    pixelDensity(2)
    frameRate(15)

def draw():
    background(255)
    ep = EPattern(fillin_pixels_amount = 14,
                  element_size = 5,
                  pixels_size = 4,
                  pixels_gap = 2)
    ep.plot()
    #noLoop()

