import math

f = file("030_data/test_online.txt.libsvmformat")
test_f = f.readlines()
for i in range(0,int(math.ceil(float(len(test_f))/40000))):
    w = open("030_data/test_online_"+str(i)+".txt.libsvmformat","a+")
    if (i+1)*40000>=len(test_f):
        w.writelines(test_f[i*40000:])
    else:
        w.writelines(test_f[i*40000:40000*(i+1)])
    w.close()
f.close()

f = file("030_data/test_online.txt")
test_f_mid = f.readlines()
test_f = []
for line in test_f_mid:
	test_f.append(','.join(line.split(',')[0:2])+'\n')

for i in range(0,int(math.ceil(float(len(test_f))/40000))):
    w = open("030_data/test_online_"+str(i)+".txt","a+")
    if (i+1)*40000>=len(test_f):
        w.writelines(test_f[i*40000:])
    else:
        w.writelines(test_f[i*40000:40000*(i+1)])
    w.close()
f.close()

