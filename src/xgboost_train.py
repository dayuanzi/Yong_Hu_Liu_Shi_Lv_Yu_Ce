#!usr/bin/env python
# -*- coding: utf-8 -*-

import xgboost as xgb
from datetime import datetime
# import judge_result
import io_operation
import sys

def xgboost_main(deep,rate,times):
    
    dtrain = xgb.DMatrix(sys.argv[4])
    param = {'max_depth':deep, 'eta':rate, 'silent':0, 'objective':'binary:logistic' }
    num_round = times
    #  6,300,0.1   8,300,0.1   3,300,0.2   4,300,0.15  5,300,0.17
    bst = xgb.train(param, dtrain, num_round)
    bst.save_model('model_auto/xgboost_model_'+sys.argv[5]+'_'+ sys.argv[1] +'_'+ sys.argv[2] +'_'+ sys.argv[3]+".model")



xgboost_main(int(sys.argv[1]), float(sys.argv[2]), int(sys.argv[3]))

