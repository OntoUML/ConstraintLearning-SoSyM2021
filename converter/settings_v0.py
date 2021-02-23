import re
import pandas as pd
from owlready2 import *

onto = get_ontology("crime_SoSym.owl")
onto.load()
onto.classes()

onto.object_properties()
onto.classes()

classes = [[i] for i in list(onto.classes())]
classes0 = [''.join(map(str, i)) for i in classes]
classes1 = [re.sub(r'gufo\.', '', i) for i in classes0]
classes2 = [re.sub(r'\.', '', i) for i in classes1]
classes3 = [(i+","+j) for i in classes2 for j in classes2 if i == j]
classes4 = [re.sub(r',', '(', i) for i in classes3]
classes5 = [(i+").") for i in classes4]
base.c = [("base("+i) for i in classes5]

pro = [[i] for i in list(onto.object_properties())]
domain = [prop.domain for prop in onto.object_properties()]
range = [prop.range for prop in onto.object_properties()]

zipped = [''.join(map(str, i)) for i in zip(pro,domain,range)]

zipped0 = [re.sub(r'gufo', '', i) for i in zipped]
zipped1 = [re.sub(r'\[\.', 'base(', i, count=1) for i in zipped0]
zipped2 = [re.sub(r'\]\[\.', '(', i, count=1) for i in zipped1]
zipped3 = [re.sub(r'\]\[\.', ',', i, count=1) for i in zipped2] 
zipped4 = [re.sub(r'\]\[owl\.', '(', i, count=1) for i in zipped3]
zipped5 = [re.sub(r'time\.', '', i) for i in zipped4]
zipped6 = [re.sub(r'\.', '', i) for i in zipped5]
zipped7 = [re.sub(r'\]\[owl', ',', i) for i in zipped6]
zipped8 = [re.sub(r'\]\[', ',', i, count=1) for i in zipped7]
zipped9 = [re.sub(r',\]', ').', i, count=1) for i in zipped8]
base.p = [re.sub(r'\]', ').', i, count=1) for i in zipped9]

modes = [re.sub(r'\(', '[', i, count=1) for i in base.p]
modes0 = [re.sub(r'\((.*?)\)', '(+,+)', i) for i in modes]
modes1 = [re.sub(r'\((.*?)\)', '(-,-)', i) for i in modes]
modes2 = [re.sub(r'\((.*?)\)', '(+,-)', i) for i in modes]
modes3 = [re.sub(r'\((.*?)\)', '(-,+)', i) for i in modes]

asso1 = [re.sub(r'base\[', '', i) for i in modes0]
asso2 = [re.sub(r'base\[', '', i) for i in modes1]
asso3 = [re.sub(r'base\[', '', i) for i in modes2]
asso4 = [re.sub(r'base\[', '', i) for i in modes3]

print("%Modes Declarations")
print("%Types")
for i in classes2:
	print(i.lower()+"(+).") 
for i in classes2:
	print(i.lower()+"(-).") 
print("%Associations")
for i in asso1: 
 print(i.lower())
for i in asso2: 
 print(i.lower())
for i in asso3: 
 print(i.lower())
for i in asso4: 
 print(i.lower()) 
 
print("%Base definitions")
print("%Types")
for i in base.p: 
 print(i.lower())
print("%Associations")
for i in base.c: 
 print(i.lower())





