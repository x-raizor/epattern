
# ~·~·~·~·~·~·~·~·~·~·~·
# Every Pixel pattern
# Code by Andrew Shapiro
# ~·~·~·~·~·~·~·~·~·~·~·

DOTS_NUMBER = 50
ROSETTE_SIZE = 8
PIXEL_SIZE = 8
PIXEL_GAP = 1
SAVE_SVG = False


add_library('svg')
from EPattern import EPattern
import random 

def settings():
    side = ROSETTE_SIZE * 2 * (PIXEL_SIZE + PIXEL_GAP)
    size(side, side)  # canvas size

def setup():
    pixelDensity(2)  # 2/1 - Retina/not
    frameRate(15)  # animation speed   

def draw():
    background(255, 0)
        
    if SAVE_SVG:
        hash_name = random.getrandbits(64)
        beginRecord(SVG, 'svg/' + str(hash_name) + ".svg")
        
    ep = EPattern(fillin_pixels_amount = DOTS_NUMBER,
            element_size = ROSETTE_SIZE,
            pixels_size = PIXEL_SIZE,
            pixels_gap = PIXEL_GAP)
    ep.plot()
    
    if SAVE_SVG:
        endRecord()
    
    noLoop()  # stop animation
    