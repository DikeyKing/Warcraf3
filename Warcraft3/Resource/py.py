#!/usr/bin/python
# -*- coding: UTF-8 -*-

import os
count = 1
path = "/Users/king/Documents/developer/2019/S2/Warcraft3/Warcraft3/"

for filename in os.listdir(path):
    try:
        f_name = filename.split("+")[1]
        f_name = f_name.split(".")[0]+"."+f_name.split(".")[1]
        os.rename(path+filename,path+f_name)
        count +=1
    except:
        f_name = filename.split("+")[1]
        f_name = f_name.split(".")[0]+str(count)+"."+f_name.split(".")[1]
        os.rename(path+filename,path+f_name)
        count+=1
