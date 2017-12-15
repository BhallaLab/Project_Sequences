# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""
from tkinter import *    #tkinter is the library for creating the canvas
import numpy as np       
import csv

#gridSize determines the resolution of the Polygon frames
#A grid size of 300 corresponds to  ___ µm resolution using a 40x objective
gridSize = 300;


coordX = [];
coordY = [];

#Height and width of the overlay canvas for selecting the neurons
#Standard camera resolution
height = 480;
width = 640;

#A function to register the locations of mouse clicks on the canvas
def getorigin(mouseClick):
    global x,y
    x = int(mouseClick.x*gridSize/width);
    y = int(mouseClick.y*gridSize/height);
    
    coordX.append(x)
    coordY.append(y)
 
#Create a main window with fixed size
root = Tk()                                   #root is the main window object
root.resizable(width=False, height=False)
root.attributes("-alpha",0.4)
root.maxsize(width,height);
root.minsize(width,height);

#Create a canvas inside the main window which is
#equal to the main window in dimensions
screen = Canvas(root, width=width, height=height)
screen.pack()                  #object.pack() finishes the object design and shows it

screen.bind("<Button 1>",getorigin); #creating an even triggered by left mouse single click
root.mainloop()                      #finishing the main window design loop

#write a csv file with first two columns as grid size
#3rd and 4th columns are the X and Y coordinates of the clicks respectively

with open('sequence.csv', 'w') as csvfile:
    for i in range(len(coordX)):
        SeqWriter = csv.writer(csvfile, delimiter=' ')
        SeqWriter.writerow([300,300,coordX[i],coordY[i]])
        
#write a polygon readble file
#with open('polygonFile.csv','w') as csvfile:
    