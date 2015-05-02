#!/usr/bin/env python
# -*- coding: utf-8 -*-

def countWord(orglist, list_uniq):
    countList = [];
    for row in list_uniq:
        countList.append(orglist.count(row));
    return countList;
#        print orglist.count(row);

import sys
import csv

csvReader = csv.reader(open('google_trends.csv', 'rb'), delimiter=',', quotechar=',')
orglist = [];
for row in csvReader:
    orglist.append(row[1]);
    #print ', '.join(row)

list_uniq = list(set(orglist))
for row in list_uniq:
    print row, "\n";

countList = countWord(orglist, list_uniq);

csvWriter = csv.writer(open('countWord.csv', 'wb'), delimiter=',',
                        quotechar=',', quoting=csv.QUOTE_MINIMAL)
csvWriter.writerow(list_uniq);
csvWriter.writerow(countList);

countListIndex = sorted(range(len(countList)), key=lambda k: countList[k]);
#countListIndex = countListIndex.reverse();
sortedWordList = [];

#reverseCountListIndex = countListIndex.reverse();
for row in countListIndex[::-1]:
    sortedWordList.append(list_uniq[row]);

sortedcsvWriter = csv.writer(open('sortedWord.csv', 'wb'), delimiter=',',
                       quotechar=',', quoting=csv.QUOTE_MINIMAL)
sortedcsvWriter.writerow(sortedWordList);
sortedcsvWriter.writerow(sorted(countList)[::-1]);

import pylab as pl
import numpy as np

x = np.linspace(0, len(countList)-1, len(countList))
print len(x);
print len(sorted(countList)[::-1])
pl.plot(x, sorted(countList)[::-1]);

pl.show();
