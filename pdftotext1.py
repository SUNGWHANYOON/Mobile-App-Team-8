# -*- coding: utf-8 -*-
"""
Created on Tue May 10 00:50:00 2022

@author: User
"""

import sys
import io

import pdftotext
import os

import codecs

file = open(r"C:\Users\User\Desktop\20170526박물관소장유물도록.pdf", 'rb')
fileReader = pdftotext.PDF(file)

f = open(r"C:\Users\User\Desktop\20170526박물관소장유물도록.txt",'w',encoding = 'UTF-8')

f.write(u'\ufeff')
for writedown in fileReader:
    f.write(writedown)

f.close()