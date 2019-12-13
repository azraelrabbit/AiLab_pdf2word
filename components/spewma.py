#!/usr/bin/env python3
from pyspc import *
import pandas as pd
import os
def spewma(data,output_dir):
    a = spc(data) + ewma()
    os.makedirs(output_dir, exist_ok=True)
    fname = os.path.join(output_dir, "ewma.jpg")
    a.save(fname)
    return fname
    
if __name__=="__main__":
    data = pd.read_csv("pistonrings.csv").values
    output_dir = "res"
    output_dir = spewma(data,output_dir)
    
