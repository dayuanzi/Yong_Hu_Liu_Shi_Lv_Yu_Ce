#!usr/bin/env python
# -*- coding: utf-8 -*-

import xgboost as xgb
from datetime import datetime
# import judge_result
import io_operation
import sys
def read_file_for_local_test():#本地测试的程序读写
    f1 = open(sys.argv[4])
    test_id_list = []
    test_data_y = []
    for eachline in f1 :
        if eachline.__contains__('sampleid'):
            continue
        if len(eachline.split('\n')[0].split('\r')[0].split(',')) < 2:
            print eachline
            continue
        current_id = eachline.split('\n')[0].split('\r')[0].split(',')[1]
        test_data_y.append(int(eachline.split('\n')[0].split('\r')[0].split(',')[0]))
        test_id_list.append(current_id)
    f1.close();
    return test_id_list, test_data_y

def xgboost_main(deep,rate,times):
    dtest = xgb.DMatrix(sys.argv[5])
    param = {'max_depth':deep, 'eta':rate, 'silent':0, 'objective':'binary:logistic' }
    bst = xgb.Booster()
    bst.load_model('model_auto/xgboost_model_'+sys.argv[6]+'_'+ sys.argv[1] +'_'+ sys.argv[2] +'_'+ sys.argv[3]+".model")

    preds = bst.predict(dtest)
    return preds

test_id_list,label = read_file_for_local_test()
prediction = xgboost_main(int(sys.argv[1]), float(sys.argv[2]), int(sys.argv[3]))
if len(test_id_list) != len(prediction):
    exit(-1)
predict_sample = {}
test_sample = {}
for i in range(len(test_id_list)):
    predict_sample.setdefault(test_id_list[i], 1 - prediction[i])
    test_sample.setdefault(test_id_list[i], label[i])
    io_operation.write_to_file('result/result_'+sys.argv[6]+'_'+sys.argv[7]+'_'+ sys.argv[1] +'_'+ sys.argv[2] +'_'+ sys.argv[3] +'_.csv',str(test_id_list[i]) + ',' + str(1 - prediction[i]) + ',' + str(label[i]) )
exit(0)

