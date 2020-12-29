from PIL import Image
import numpy
from collections import Counter
import matplotlib.pyplot as plt

def compare(bug_series,patch_series):
    bug_series_change_point_list = []
    patch_series_change_point_list = []
    acc = 0
    for i in range(len(bug_series)-1):
        if abs(bug_series[i+1] - bug_series[i]) > 5:
            bug_series_change_point_list.append(i)
    for j in range(len(patch_series)-1):
        if abs(patch_series[j+1] - patch_series[j]) > 5:
            patch_series_change_point_list.append(j)
            if j in bug_series_change_point_list:
                acc+=1
    if acc/len(bug_series_change_point_list) > 0.99:
        return True
    else:
        return False

def main(image):
    step_size = 50
    img1 = Image.open(image)
    img2 = Image.open('Bug Final.png')
    bug_matrix = numpy.asarray(img2.convert('1')) + 0
    bug_time_series = []
    for i in bug_matrix:
        bug_time_series.append(Counter(i)[1])

    for x in range(0, img1.size[0] - img2.size[0] + 1,step_size):
        for y in range(0, img1.size[1] - img2.size[1] + 1,step_size):
            patch = img1.crop((x, y, x + img2.size[0], y + img2.size[1]))
            patch_matrix = numpy.asarray(patch.convert('1')) + 0
            patch_time_series = []
            for i in patch_matrix:
                patch_time_series.append(Counter(i)[1])
            if compare(bug_time_series, patch_time_series) is True:
                print('the coordinate of bug is :',(x,y))



main('test1.png')
main('test2.png')
main('test3.png')

