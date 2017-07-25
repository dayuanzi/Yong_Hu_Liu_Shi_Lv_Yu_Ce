#!usr/bin/env python
# -*- coding: utf-8 -*-

import io_operation
import random


def read_file():
    f1 = open('data/train_online.txt')
    train_data_x_0 = []
    train_data_x_1 = []


    for eachline in f1 :
        if eachline.__contains__('sampleid') or len(eachline)<5:
            continue
        shuxings = eachline.split('\n')[0].split('\r')[0].split(',')
        #if str(shuxings[2]) == '2016-05-20':
        #    if int(shuxings[0]) == 1:
        #        test_data_x_1.append(str(shuxings[1])+'\n')
                #test_data_x_1.append(eachline.split('\n')[0].split('\r')[0]+'\n')
        #    else:
        #        test_data_x_0.append(str(shuxings[1])+'\n')
                #test_data_x_0.append(eachline.split('\n')[0].split('\r')[0]+'\n')
        #else:
        if int(shuxings[0]) == 1:
            #train_data_x_1.append(str(shuxings[1])+'\n')
            train_data_x_1.append(eachline.split('\n')[0].split('\r')[0]+'\n')
        else:
            #train_data_x_0.append(str(shuxings[1])+'\n')
            train_data_x_0.append(eachline.split('\n')[0].split('\r')[0]+'\n')

    return train_data_x_0,train_data_x_1


def dataSample(train_data_x_0,train_data_x_1):
    train_data_x_0 = random.sample(train_data_x_0,90000)
    train_data_x_1 = random.sample(train_data_x_1,130000)
    return train_data_x_0,train_data_x_1


if __name__ == '__main__':


    train_data_x_0,train_data_x_1= read_file()
    train_data_x_0,train_data_x_1 = dataSample(train_data_x_0,train_data_x_1)
    train_data_x = train_data_x_0
    train_data_x.extend(train_data_x_1)
    io_operation.write_to_file('030_data/train_030_1_1.txt',train_data_x)


    train_data_x_0,train_data_x_1 = read_file()
    train_data_x_0,train_data_x_1 = dataSample(train_data_x_0,train_data_x_1)
    train_data_x = train_data_x_0
    train_data_x.extend(train_data_x_1)
    io_operation.write_to_file('030_data/train_030_1_2.txt',train_data_x)

    train_data_x_0,train_data_x_1 = read_file()
    train_data_x_0,train_data_x_1 = dataSample(train_data_x_0,train_data_x_1)
    train_data_x = train_data_x_0
    train_data_x.extend(train_data_x_1)
    io_operation.write_to_file('030_data/train_030_1_3.txt',train_data_x)


    train_data_x_0,train_data_x_1 = read_file()
    train_data_x_0,train_data_x_1 = dataSample(train_data_x_0,train_data_x_1)
    train_data_x = train_data_x_0
    train_data_x.extend(train_data_x_1)
    io_operation.write_to_file('030_data/train_030_1_4.txt',train_data_x)


    train_data_x_0,train_data_x_1 = read_file()
    train_data_x_0,train_data_x_1 = dataSample(train_data_x_0,train_data_x_1)
    train_data_x = train_data_x_0
    train_data_x.extend(train_data_x_1)
    io_operation.write_to_file('030_data/train_030_1_5.txt',train_data_x)
