import math

ParamList = [[4,0.1,200],[4,0.08,250],[5,0.06,230],[5,0.08,200],[6,0.05,220],[6,0.07,190]]
for i in range(0,6):
    Param = ParamList[i]
    for k in range(1,6):
        data = []
        for j in range(1,12):
            f = file("result/result_Train_"+str(k)+'_'+"Test_"+str(j)+'_'+str(Param[0])+'_'+str(Param[1])+'_'+str(Param[2])+'_.csv')
            for line in f.readlines():
                data.append(line)
            f.close()
        w = file("result/result_Train_"+str(k)+'_'+str(Param[0])+'_'+str(Param[1])+'_'+str(Param[2])+'_.csv','ab+')
        w.writelines(data)
        w.close()

