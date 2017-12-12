
# ~·~·~·~·~·~·~·~·~·~·~·
# Every Pixel pattern
# Code by Andrew Shapiro
# ~·~·~·~·~·~·~·~·~·~·~·

DOTS_NUMBER = 16
ROSETTE_SIZE = 5
PIXEL_SIZE = 4
PIXEL_GAP = 2

add_library('svg')
from EPattern import EPattern
import random 

def settings():
    side = ROSETTE_SIZE * 2*(PIXEL_SIZE + PIXEL_GAP) - PIXEL_GAP
    size(side, side)

def setup():
    pixelDensity(2)
    frameRate(15)    

def draw():
    background(255, 0)
    
    ep = EPattern(fillin_pixels_amount = DOTS_NUMBER,
                  element_size = ROSETTE_SIZE,
                  pixels_size = PIXEL_SIZE,
                  pixels_gap = PIXEL_GAP)
    
    hash_name = random.getrandbits(64)
    beginRecord(SVG, 'svg/' + str(hash_name) + ".svg")
    ep.plot()
    endRecord()
    
    #noLoop()
    