from PIL import Image
import numpy
import re
import math
import sys


def binToColor(inp):
  return (int(inp[:3], 2)*32, int(inp[3:6], 2)*32, int(inp[6:], 2)*64)


inFile = open(sys.argv[1])
vector = inFile.read()

vector = re.sub('\s*;.+\n', '', vector)
vector = re.sub(',?\s*;', '', vector)
vector = re.sub('memory_initialization_radix.*\n', '', vector)
vector = re.sub('memory_initialization_vector\s*=\s*', '', vector)
vector = vector.replace('\n', '')
vector = vector.strip().split(',')
vector = list(map(binToColor, vector))

l = int(math.sqrt(len(vector)))
pic = [[vector[i*l+j] for j in range(l)] for i in range(l)]

data = numpy.array(pic, dtype=numpy.uint8)

im = Image.fromarray(data, 'RGB')
im.show()
im.save(sys.argv[2])
