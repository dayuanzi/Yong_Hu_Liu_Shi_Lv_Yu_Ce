#!/usr/bin/env bash



python fillNull.py
python findSamePeople.py
python mergeFeatures.py
python dataFilter.py
#进行数据格式转换

python format_translate1.py 030_data/train_030_1_1.txt 030_data/train_030_1_1.txt.libsvmformat
python format_translate1.py 030_data/train_030_1_2.txt 030_data/train_030_1_2.txt.libsvmformat
python format_translate1.py 030_data/train_030_1_3.txt 030_data/train_030_1_3.txt.libsvmformat
python format_translate1.py 030_data/train_030_1_4.txt 030_data/train_030_1_4.txt.libsvmformat
python format_translate1.py 030_data/train_030_1_5.txt 030_data/train_030_1_5.txt.libsvmformat
python format_translate1.py 030_data/test_online.txt 030_data/test_online.txt.libsvmformat

# 创建文件夹
mkdir result
mkdir model_auto

# 删除之前生成的所有结果
rm result/*
rm model_auto/*

python splitTestOnline.py


# 开始运行模型
#1
python xgboost_train.py 4 0.1 200 030_data/train_030_1_1.txt.libsvmformat Train_1
python xgboost_train.py 4 0.1 200 030_data/train_030_1_2.txt.libsvmformat Train_2
python xgboost_train.py 4 0.1 200 030_data/train_030_1_3.txt.libsvmformat Train_3
python xgboost_train.py 4 0.1 200 030_data/train_030_1_4.txt.libsvmformat Train_4
python xgboost_train.py 4 0.1 200 030_data/train_030_1_5.txt.libsvmformat Train_5

#2
python xgboost_train.py 4 0.08 250 030_data/train_030_1_1.txt.libsvmformat Train_1
python xgboost_train.py 4 0.08 250 030_data/train_030_1_2.txt.libsvmformat Train_2
python xgboost_train.py 4 0.08 250 030_data/train_030_1_3.txt.libsvmformat Train_3
python xgboost_train.py 4 0.08 250 030_data/train_030_1_4.txt.libsvmformat Train_4
python xgboost_train.py 4 0.08 250 030_data/train_030_1_5.txt.libsvmformat Train_5

#3
python xgboost_train.py 5 0.06 230 030_data/train_030_1_1.txt.libsvmformat Train_1
python xgboost_train.py 5 0.06 230 030_data/train_030_1_2.txt.libsvmformat Train_2
python xgboost_train.py 5 0.06 230 030_data/train_030_1_3.txt.libsvmformat Train_3
python xgboost_train.py 5 0.06 230 030_data/train_030_1_4.txt.libsvmformat Train_4
python xgboost_train.py 5 0.06 230 030_data/train_030_1_5.txt.libsvmformat Train_5

#4
python xgboost_train.py 5 0.08 200 030_data/train_030_1_1.txt.libsvmformat Train_1
python xgboost_train.py 5 0.08 200 030_data/train_030_1_2.txt.libsvmformat Train_2
python xgboost_train.py 5 0.08 200 030_data/train_030_1_3.txt.libsvmformat Train_3
python xgboost_train.py 5 0.08 200 030_data/train_030_1_4.txt.libsvmformat Train_4
python xgboost_train.py 5 0.08 200 030_data/train_030_1_5.txt.libsvmformat Train_5

#5
python xgboost_train.py 6 0.05 220 030_data/train_030_1_1.txt.libsvmformat Train_1
python xgboost_train.py 6 0.05 220 030_data/train_030_1_2.txt.libsvmformat Train_2
python xgboost_train.py 6 0.05 220 030_data/train_030_1_3.txt.libsvmformat Train_3
python xgboost_train.py 6 0.05 220 030_data/train_030_1_4.txt.libsvmformat Train_4
python xgboost_train.py 6 0.05 220 030_data/train_030_1_5.txt.libsvmformat Train_5

#6
python xgboost_train.py 6 0.07 190 030_data/train_030_1_1.txt.libsvmformat Train_1
python xgboost_train.py 6 0.07 190 030_data/train_030_1_2.txt.libsvmformat Train_2
python xgboost_train.py 6 0.07 190 030_data/train_030_1_3.txt.libsvmformat Train_3
python xgboost_train.py 6 0.07 190 030_data/train_030_1_4.txt.libsvmformat Train_4
python xgboost_train.py 6 0.07 190 030_data/train_030_1_5.txt.libsvmformat Train_5


####predict

#1
python xgboost_predict.py 4 0.1 200 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_1 Test_1
python xgboost_predict.py 4 0.1 200 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_2 Test_1
python xgboost_predict.py 4 0.1 200 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_3 Test_1
python xgboost_predict.py 4 0.1 200 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_4 Test_1
python xgboost_predict.py 4 0.1 200 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_5 Test_1

python xgboost_predict.py 4 0.1 200 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_1 Test_2
python xgboost_predict.py 4 0.1 200 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_2 Test_2
python xgboost_predict.py 4 0.1 200 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_3 Test_2
python xgboost_predict.py 4 0.1 200 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_4 Test_2
python xgboost_predict.py 4 0.1 200 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_5 Test_2

python xgboost_predict.py 4 0.1 200 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_1 Test_3
python xgboost_predict.py 4 0.1 200 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_2 Test_3
python xgboost_predict.py 4 0.1 200 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_3 Test_3
python xgboost_predict.py 4 0.1 200 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_4 Test_3
python xgboost_predict.py 4 0.1 200 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_5 Test_3


python xgboost_predict.py 4 0.1 200 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_1 Test_4
python xgboost_predict.py 4 0.1 200 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_2 Test_4
python xgboost_predict.py 4 0.1 200 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_3 Test_4
python xgboost_predict.py 4 0.1 200 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_4 Test_4
python xgboost_predict.py 4 0.1 200 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_5 Test_4


python xgboost_predict.py 4 0.1 200 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_1 Test_5
python xgboost_predict.py 4 0.1 200 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_2 Test_5
python xgboost_predict.py 4 0.1 200 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_3 Test_5
python xgboost_predict.py 4 0.1 200 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_4 Test_5
python xgboost_predict.py 4 0.1 200 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_5 Test_5


python xgboost_predict.py 4 0.1 200 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_1 Test_6
python xgboost_predict.py 4 0.1 200 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_2 Test_6
python xgboost_predict.py 4 0.1 200 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_3 Test_6
python xgboost_predict.py 4 0.1 200 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_4 Test_6
python xgboost_predict.py 4 0.1 200 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_5 Test_6


python xgboost_predict.py 4 0.1 200 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_1 Test_7
python xgboost_predict.py 4 0.1 200 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_2 Test_7
python xgboost_predict.py 4 0.1 200 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_3 Test_7
python xgboost_predict.py 4 0.1 200 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_4 Test_7
python xgboost_predict.py 4 0.1 200 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_5 Test_7


python xgboost_predict.py 4 0.1 200 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_1 Test_8
python xgboost_predict.py 4 0.1 200 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_2 Test_8
python xgboost_predict.py 4 0.1 200 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_3 Test_8
python xgboost_predict.py 4 0.1 200 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_4 Test_8
python xgboost_predict.py 4 0.1 200 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_5 Test_8

python xgboost_predict.py 4 0.1 200 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_1 Test_9
python xgboost_predict.py 4 0.1 200 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_2 Test_9
python xgboost_predict.py 4 0.1 200 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_3 Test_9
python xgboost_predict.py 4 0.1 200 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_4 Test_9
python xgboost_predict.py 4 0.1 200 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_5 Test_9

python xgboost_predict.py 4 0.1 200 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_1 Test_10
python xgboost_predict.py 4 0.1 200 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_2 Test_10
python xgboost_predict.py 4 0.1 200 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_3 Test_10
python xgboost_predict.py 4 0.1 200 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_4 Test_10
python xgboost_predict.py 4 0.1 200 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_5 Test_10

python xgboost_predict.py 4 0.1 200 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_1 Test_11
python xgboost_predict.py 4 0.1 200 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_2 Test_11
python xgboost_predict.py 4 0.1 200 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_3 Test_11
python xgboost_predict.py 4 0.1 200 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_4 Test_11
python xgboost_predict.py 4 0.1 200 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_5 Test_11


#2
python xgboost_predict.py 4 0.08 250 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_1 Test_1
python xgboost_predict.py 4 0.08 250 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_2 Test_1
python xgboost_predict.py 4 0.08 250 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_3 Test_1
python xgboost_predict.py 4 0.08 250 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_4 Test_1
python xgboost_predict.py 4 0.08 250 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_5 Test_1

python xgboost_predict.py 4 0.08 250 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_1 Test_2
python xgboost_predict.py 4 0.08 250 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_2 Test_2
python xgboost_predict.py 4 0.08 250 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_3 Test_2
python xgboost_predict.py 4 0.08 250 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_4 Test_2
python xgboost_predict.py 4 0.08 250 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_5 Test_2

python xgboost_predict.py 4 0.08 250 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_1 Test_3
python xgboost_predict.py 4 0.08 250 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_2 Test_3
python xgboost_predict.py 4 0.08 250 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_3 Test_3
python xgboost_predict.py 4 0.08 250 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_4 Test_3
python xgboost_predict.py 4 0.08 250 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_5 Test_3


python xgboost_predict.py 4 0.08 250 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_1 Test_4
python xgboost_predict.py 4 0.08 250 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_2 Test_4
python xgboost_predict.py 4 0.08 250 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_3 Test_4
python xgboost_predict.py 4 0.08 250 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_4 Test_4
python xgboost_predict.py 4 0.08 250 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_5 Test_4


python xgboost_predict.py 4 0.08 250 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_1 Test_5
python xgboost_predict.py 4 0.08 250 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_2 Test_5
python xgboost_predict.py 4 0.08 250 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_3 Test_5
python xgboost_predict.py 4 0.08 250 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_4 Test_5
python xgboost_predict.py 4 0.08 250 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_5 Test_5


python xgboost_predict.py 4 0.08 250 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_1 Test_6
python xgboost_predict.py 4 0.08 250 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_2 Test_6
python xgboost_predict.py 4 0.08 250 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_3 Test_6
python xgboost_predict.py 4 0.08 250 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_4 Test_6
python xgboost_predict.py 4 0.08 250 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_5 Test_6


python xgboost_predict.py 4 0.08 250 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_1 Test_7
python xgboost_predict.py 4 0.08 250 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_2 Test_7
python xgboost_predict.py 4 0.08 250 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_3 Test_7
python xgboost_predict.py 4 0.08 250 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_4 Test_7
python xgboost_predict.py 4 0.08 250 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_5 Test_7


python xgboost_predict.py 4 0.08 250 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_1 Test_8
python xgboost_predict.py 4 0.08 250 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_2 Test_8
python xgboost_predict.py 4 0.08 250 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_3 Test_8
python xgboost_predict.py 4 0.08 250 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_4 Test_8
python xgboost_predict.py 4 0.08 250 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_5 Test_8

python xgboost_predict.py 4 0.08 250 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_1 Test_9
python xgboost_predict.py 4 0.08 250 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_2 Test_9
python xgboost_predict.py 4 0.08 250 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_3 Test_9
python xgboost_predict.py 4 0.08 250 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_4 Test_9
python xgboost_predict.py 4 0.08 250 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_5 Test_9

python xgboost_predict.py 4 0.08 250 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_1 Test_10
python xgboost_predict.py 4 0.08 250 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_2 Test_10
python xgboost_predict.py 4 0.08 250 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_3 Test_10
python xgboost_predict.py 4 0.08 250 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_4 Test_10
python xgboost_predict.py 4 0.08 250 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_5 Test_10

python xgboost_predict.py 4 0.08 250 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_1 Test_11
python xgboost_predict.py 4 0.08 250 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_2 Test_11
python xgboost_predict.py 4 0.08 250 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_3 Test_11
python xgboost_predict.py 4 0.08 250 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_4 Test_11
python xgboost_predict.py 4 0.08 250 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_5 Test_11



#3
python xgboost_predict.py 5 0.06 230 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_1 Test_1
python xgboost_predict.py 5 0.06 230 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_2 Test_1
python xgboost_predict.py 5 0.06 230 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_3 Test_1
python xgboost_predict.py 5 0.06 230 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_4 Test_1
python xgboost_predict.py 5 0.06 230 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_5 Test_1

python xgboost_predict.py 5 0.06 230 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_1 Test_2
python xgboost_predict.py 5 0.06 230 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_2 Test_2
python xgboost_predict.py 5 0.06 230 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_3 Test_2
python xgboost_predict.py 5 0.06 230 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_4 Test_2
python xgboost_predict.py 5 0.06 230 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_5 Test_2

python xgboost_predict.py 5 0.06 230 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_1 Test_3
python xgboost_predict.py 5 0.06 230 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_2 Test_3
python xgboost_predict.py 5 0.06 230 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_3 Test_3
python xgboost_predict.py 5 0.06 230 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_4 Test_3
python xgboost_predict.py 5 0.06 230 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_5 Test_3


python xgboost_predict.py 5 0.06 230 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_1 Test_4
python xgboost_predict.py 5 0.06 230 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_2 Test_4
python xgboost_predict.py 5 0.06 230 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_3 Test_4
python xgboost_predict.py 5 0.06 230 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_4 Test_4
python xgboost_predict.py 5 0.06 230 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_5 Test_4


python xgboost_predict.py 5 0.06 230 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_1 Test_5
python xgboost_predict.py 5 0.06 230 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_2 Test_5
python xgboost_predict.py 5 0.06 230 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_3 Test_5
python xgboost_predict.py 5 0.06 230 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_4 Test_5
python xgboost_predict.py 5 0.06 230 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_5 Test_5


python xgboost_predict.py 5 0.06 230 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_1 Test_6
python xgboost_predict.py 5 0.06 230 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_2 Test_6
python xgboost_predict.py 5 0.06 230 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_3 Test_6
python xgboost_predict.py 5 0.06 230 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_4 Test_6
python xgboost_predict.py 5 0.06 230 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_5 Test_6


python xgboost_predict.py 5 0.06 230 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_1 Test_7
python xgboost_predict.py 5 0.06 230 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_2 Test_7
python xgboost_predict.py 5 0.06 230 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_3 Test_7
python xgboost_predict.py 5 0.06 230 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_4 Test_7
python xgboost_predict.py 5 0.06 230 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_5 Test_7


python xgboost_predict.py 5 0.06 230 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_1 Test_8
python xgboost_predict.py 5 0.06 230 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_2 Test_8
python xgboost_predict.py 5 0.06 230 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_3 Test_8
python xgboost_predict.py 5 0.06 230 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_4 Test_8
python xgboost_predict.py 5 0.06 230 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_5 Test_8

python xgboost_predict.py 5 0.06 230 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_1 Test_9
python xgboost_predict.py 5 0.06 230 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_2 Test_9
python xgboost_predict.py 5 0.06 230 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_3 Test_9
python xgboost_predict.py 5 0.06 230 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_4 Test_9
python xgboost_predict.py 5 0.06 230 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_5 Test_9

python xgboost_predict.py 5 0.06 230 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_1 Test_10
python xgboost_predict.py 5 0.06 230 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_2 Test_10
python xgboost_predict.py 5 0.06 230 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_3 Test_10
python xgboost_predict.py 5 0.06 230 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_4 Test_10
python xgboost_predict.py 5 0.06 230 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_5 Test_10

python xgboost_predict.py 5 0.06 230 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_1 Test_11
python xgboost_predict.py 5 0.06 230 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_2 Test_11
python xgboost_predict.py 5 0.06 230 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_3 Test_11
python xgboost_predict.py 5 0.06 230 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_4 Test_11
python xgboost_predict.py 5 0.06 230 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_5 Test_11



#4
python xgboost_predict.py 5 0.08 200 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_1 Test_1
python xgboost_predict.py 5 0.08 200 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_2 Test_1
python xgboost_predict.py 5 0.08 200 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_3 Test_1
python xgboost_predict.py 5 0.08 200 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_4 Test_1
python xgboost_predict.py 5 0.08 200 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_5 Test_1

python xgboost_predict.py 5 0.08 200 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_1 Test_2
python xgboost_predict.py 5 0.08 200 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_2 Test_2
python xgboost_predict.py 5 0.08 200 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_3 Test_2
python xgboost_predict.py 5 0.08 200 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_4 Test_2
python xgboost_predict.py 5 0.08 200 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_5 Test_2

python xgboost_predict.py 5 0.08 200 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_1 Test_3
python xgboost_predict.py 5 0.08 200 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_2 Test_3
python xgboost_predict.py 5 0.08 200 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_3 Test_3
python xgboost_predict.py 5 0.08 200 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_4 Test_3
python xgboost_predict.py 5 0.08 200 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_5 Test_3


python xgboost_predict.py 5 0.08 200 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_1 Test_4
python xgboost_predict.py 5 0.08 200 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_2 Test_4
python xgboost_predict.py 5 0.08 200 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_3 Test_4
python xgboost_predict.py 5 0.08 200 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_4 Test_4
python xgboost_predict.py 5 0.08 200 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_5 Test_4


python xgboost_predict.py 5 0.08 200 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_1 Test_5
python xgboost_predict.py 5 0.08 200 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_2 Test_5
python xgboost_predict.py 5 0.08 200 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_3 Test_5
python xgboost_predict.py 5 0.08 200 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_4 Test_5
python xgboost_predict.py 5 0.08 200 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_5 Test_5


python xgboost_predict.py 5 0.08 200 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_1 Test_6
python xgboost_predict.py 5 0.08 200 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_2 Test_6
python xgboost_predict.py 5 0.08 200 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_3 Test_6
python xgboost_predict.py 5 0.08 200 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_4 Test_6
python xgboost_predict.py 5 0.08 200 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_5 Test_6


python xgboost_predict.py 5 0.08 200 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_1 Test_7
python xgboost_predict.py 5 0.08 200 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_2 Test_7
python xgboost_predict.py 5 0.08 200 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_3 Test_7
python xgboost_predict.py 5 0.08 200 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_4 Test_7
python xgboost_predict.py 5 0.08 200 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_5 Test_7


python xgboost_predict.py 5 0.08 200 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_1 Test_8
python xgboost_predict.py 5 0.08 200 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_2 Test_8
python xgboost_predict.py 5 0.08 200 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_3 Test_8
python xgboost_predict.py 5 0.08 200 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_4 Test_8
python xgboost_predict.py 5 0.08 200 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_5 Test_8

python xgboost_predict.py 5 0.08 200 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_1 Test_9
python xgboost_predict.py 5 0.08 200 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_2 Test_9
python xgboost_predict.py 5 0.08 200 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_3 Test_9
python xgboost_predict.py 5 0.08 200 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_4 Test_9
python xgboost_predict.py 5 0.08 200 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_5 Test_9

python xgboost_predict.py 5 0.08 200 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_1 Test_10
python xgboost_predict.py 5 0.08 200 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_2 Test_10
python xgboost_predict.py 5 0.08 200 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_3 Test_10
python xgboost_predict.py 5 0.08 200 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_4 Test_10
python xgboost_predict.py 5 0.08 200 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_5 Test_10

python xgboost_predict.py 5 0.08 200 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_1 Test_11
python xgboost_predict.py 5 0.08 200 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_2 Test_11
python xgboost_predict.py 5 0.08 200 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_3 Test_11
python xgboost_predict.py 5 0.08 200 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_4 Test_11
python xgboost_predict.py 5 0.08 200 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_5 Test_11




#5
python xgboost_predict.py 6 0.05 220 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_1 Test_1
python xgboost_predict.py 6 0.05 220 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_2 Test_1
python xgboost_predict.py 6 0.05 220 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_3 Test_1
python xgboost_predict.py 6 0.05 220 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_4 Test_1
python xgboost_predict.py 6 0.05 220 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_5 Test_1

python xgboost_predict.py 6 0.05 220 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_1 Test_2
python xgboost_predict.py 6 0.05 220 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_2 Test_2
python xgboost_predict.py 6 0.05 220 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_3 Test_2
python xgboost_predict.py 6 0.05 220 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_4 Test_2
python xgboost_predict.py 6 0.05 220 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_5 Test_2

python xgboost_predict.py 6 0.05 220 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_1 Test_3
python xgboost_predict.py 6 0.05 220 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_2 Test_3
python xgboost_predict.py 6 0.05 220 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_3 Test_3
python xgboost_predict.py 6 0.05 220 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_4 Test_3
python xgboost_predict.py 6 0.05 220 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_5 Test_3


python xgboost_predict.py 6 0.05 220 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_1 Test_4
python xgboost_predict.py 6 0.05 220 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_2 Test_4
python xgboost_predict.py 6 0.05 220 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_3 Test_4
python xgboost_predict.py 6 0.05 220 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_4 Test_4
python xgboost_predict.py 6 0.05 220 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_5 Test_4


python xgboost_predict.py 6 0.05 220 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_1 Test_5
python xgboost_predict.py 6 0.05 220 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_2 Test_5
python xgboost_predict.py 6 0.05 220 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_3 Test_5
python xgboost_predict.py 6 0.05 220 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_4 Test_5
python xgboost_predict.py 6 0.05 220 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_5 Test_5


python xgboost_predict.py 6 0.05 220 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_1 Test_6
python xgboost_predict.py 6 0.05 220 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_2 Test_6
python xgboost_predict.py 6 0.05 220 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_3 Test_6
python xgboost_predict.py 6 0.05 220 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_4 Test_6
python xgboost_predict.py 6 0.05 220 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_5 Test_6


python xgboost_predict.py 6 0.05 220 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_1 Test_7
python xgboost_predict.py 6 0.05 220 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_2 Test_7
python xgboost_predict.py 6 0.05 220 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_3 Test_7
python xgboost_predict.py 6 0.05 220 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_4 Test_7
python xgboost_predict.py 6 0.05 220 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_5 Test_7


python xgboost_predict.py 6 0.05 220 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_1 Test_8
python xgboost_predict.py 6 0.05 220 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_2 Test_8
python xgboost_predict.py 6 0.05 220 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_3 Test_8
python xgboost_predict.py 6 0.05 220 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_4 Test_8
python xgboost_predict.py 6 0.05 220 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_5 Test_8

python xgboost_predict.py 6 0.05 220 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_1 Test_9
python xgboost_predict.py 6 0.05 220 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_2 Test_9
python xgboost_predict.py 6 0.05 220 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_3 Test_9
python xgboost_predict.py 6 0.05 220 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_4 Test_9
python xgboost_predict.py 6 0.05 220 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_5 Test_9

python xgboost_predict.py 6 0.05 220 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_1 Test_10
python xgboost_predict.py 6 0.05 220 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_2 Test_10
python xgboost_predict.py 6 0.05 220 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_3 Test_10
python xgboost_predict.py 6 0.05 220 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_4 Test_10
python xgboost_predict.py 6 0.05 220 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_5 Test_10

python xgboost_predict.py 6 0.05 220 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_1 Test_11
python xgboost_predict.py 6 0.05 220 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_2 Test_11
python xgboost_predict.py 6 0.05 220 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_3 Test_11
python xgboost_predict.py 6 0.05 220 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_4 Test_11
python xgboost_predict.py 6 0.05 220 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_5 Test_11




#6
python xgboost_predict.py 6 0.07 190 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_1 Test_1
python xgboost_predict.py 6 0.07 190 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_2 Test_1
python xgboost_predict.py 6 0.07 190 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_3 Test_1
python xgboost_predict.py 6 0.07 190 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_4 Test_1
python xgboost_predict.py 6 0.07 190 030_data/test_online_1.txt 030_data/test_online_1.txt.libsvmformat Train_5 Test_1

python xgboost_predict.py 6 0.07 190 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_1 Test_2
python xgboost_predict.py 6 0.07 190 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_2 Test_2
python xgboost_predict.py 6 0.07 190 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_3 Test_2
python xgboost_predict.py 6 0.07 190 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_4 Test_2
python xgboost_predict.py 6 0.07 190 030_data/test_online_2.txt 030_data/test_online_2.txt.libsvmformat Train_5 Test_2

python xgboost_predict.py 6 0.07 190 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_1 Test_3
python xgboost_predict.py 6 0.07 190 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_2 Test_3
python xgboost_predict.py 6 0.07 190 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_3 Test_3
python xgboost_predict.py 6 0.07 190 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_4 Test_3
python xgboost_predict.py 6 0.07 190 030_data/test_online_3.txt 030_data/test_online_3.txt.libsvmformat Train_5 Test_3


python xgboost_predict.py 6 0.07 190 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_1 Test_4
python xgboost_predict.py 6 0.07 190 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_2 Test_4
python xgboost_predict.py 6 0.07 190 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_3 Test_4
python xgboost_predict.py 6 0.07 190 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_4 Test_4
python xgboost_predict.py 6 0.07 190 030_data/test_online_4.txt 030_data/test_online_4.txt.libsvmformat Train_5 Test_4


python xgboost_predict.py 6 0.07 190 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_1 Test_5
python xgboost_predict.py 6 0.07 190 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_2 Test_5
python xgboost_predict.py 6 0.07 190 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_3 Test_5
python xgboost_predict.py 6 0.07 190 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_4 Test_5
python xgboost_predict.py 6 0.07 190 030_data/test_online_5.txt 030_data/test_online_5.txt.libsvmformat Train_5 Test_5


python xgboost_predict.py 6 0.07 190 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_1 Test_6
python xgboost_predict.py 6 0.07 190 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_2 Test_6
python xgboost_predict.py 6 0.07 190 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_3 Test_6
python xgboost_predict.py 6 0.07 190 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_4 Test_6
python xgboost_predict.py 6 0.07 190 030_data/test_online_6.txt 030_data/test_online_6.txt.libsvmformat Train_5 Test_6


python xgboost_predict.py 6 0.07 190 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_1 Test_7
python xgboost_predict.py 6 0.07 190 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_2 Test_7
python xgboost_predict.py 6 0.07 190 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_3 Test_7
python xgboost_predict.py 6 0.07 190 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_4 Test_7
python xgboost_predict.py 6 0.07 190 030_data/test_online_7.txt 030_data/test_online_7.txt.libsvmformat Train_5 Test_7


python xgboost_predict.py 6 0.07 190 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_1 Test_8
python xgboost_predict.py 6 0.07 190 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_2 Test_8
python xgboost_predict.py 6 0.07 190 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_3 Test_8
python xgboost_predict.py 6 0.07 190 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_4 Test_8
python xgboost_predict.py 6 0.07 190 030_data/test_online_8.txt 030_data/test_online_8.txt.libsvmformat Train_5 Test_8

python xgboost_predict.py 6 0.07 190 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_1 Test_9
python xgboost_predict.py 6 0.07 190 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_2 Test_9
python xgboost_predict.py 6 0.07 190 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_3 Test_9
python xgboost_predict.py 6 0.07 190 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_4 Test_9
python xgboost_predict.py 6 0.07 190 030_data/test_online_9.txt 030_data/test_online_9.txt.libsvmformat Train_5 Test_9

python xgboost_predict.py 6 0.07 190 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_1 Test_10
python xgboost_predict.py 6 0.07 190 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_2 Test_10
python xgboost_predict.py 6 0.07 190 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_3 Test_10
python xgboost_predict.py 6 0.07 190 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_4 Test_10
python xgboost_predict.py 6 0.07 190 030_data/test_online_10.txt 030_data/test_online_10.txt.libsvmformat Train_5 Test_10

python xgboost_predict.py 6 0.07 190 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_1 Test_11
python xgboost_predict.py 6 0.07 190 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_2 Test_11
python xgboost_predict.py 6 0.07 190 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_3 Test_11
python xgboost_predict.py 6 0.07 190 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_4 Test_11
python xgboost_predict.py 6 0.07 190 030_data/test_online_11.txt 030_data/test_online_11.txt.libsvmformat Train_5 Test_11


#融合结果  生成的结果保存在 当前目录下的 avg_result_of_six_model.csv
rm avg_result_of_six_model.csv
python avg.py
