import re
import pandas as pd

a_file = open("intended0.txt", "r")

clean = [re.sub(r'=', ' ', i) for i in a_file]

list_of_lists = []
for line in clean:
  stripped_line = line.strip()
  line_list = stripped_line.split()
  list_of_lists.append(line_list)

a_file.close()

classes0 = [''.join(map(str, i)) for i in list_of_lists]
     
r = re.compile('(.*?)TOP')
filter = [a for a in classes0 if r.findall(a)]
filter0 = [re.sub(r'this/TOP', '', i) for i in filter]
filter1 = [a for a in filter0 if r.findall(a)]
filter2 = [re.sub(r'this', '', i) for i in filter1]
filter3 = [re.sub(r'/(.*?):', '', i) for i in filter2]
filter4 = [re.sub(r'/', '', i) for i in filter3]
filter4.remove(filter4[0])
filter4.remove(filter4[0])
filter5 = [re.sub(r'\{', '(', i) for i in filter4]
filter6 = [re.sub(r'\}', ')', i) for i in filter5]
filter7 = [re.sub(r',', '),(', i) for i in filter6]
filter8 = [re.sub(r'\(', ' (', i, count=1) for i in filter7]
filter9 = [re.sub(r',', ' ', i) for i in filter8]

for i in range(len(filter9)): #ok
  print(filter9[i])

list10 = []
for line in filter9:
  stripped_line = line.strip()
  line_list = stripped_line.split()
  list10.append(line_list)

list11 = [i[0]+j for i in list10 for j in i]

list12 = [a for a in list11 if r.findall(a)]

list13 = [re.sub(r'->', ',', i) for i in list12]

list14 = [list13[i] for i in range(len(list13))]

for i in list14:
	print("1::"+i.lower()+".") 




