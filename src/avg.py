#!usr/bin/env python
# -*- coding: utf-8 -*-
#
import numpy

def get_data():
    import glob
    f = glob.glob('result/*')
    data_all = {}
    for eachfile in f:

        f2 = open(eachfile)
        for eachline in f2:
            if data_all.has_key(eachline.split(',')[0]):
                data_all[eachline.split(',')[0]].append(float(eachline.split(',')[1]))
            else:
                data_all[eachline.split(',')[0]] = []
        f2.close()

    return data_all

def get_avg(data_all):
    avg_list = {}
    for line in data_all:
        avg_list[line] = numpy.mean(data_all[line])
    return avg_list

if __name__ == '__main__':
    import io_operation
    data_all = get_data()
    avg_list = get_avg(data_all)
    data_result = []
    for line in avg_list:
		data_result.append(str(line) + ',' + str(avg_list[line])+"\n")
    io_operation.write_to_file('avg_result_of_six_model.csv',data_result)


