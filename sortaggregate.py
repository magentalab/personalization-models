import urllib2
from BeautifulSoup import BeautifulSoup
from itertools import izip
import operator
import mapcrawlobjectslist as objlist

def sortlists():
	print 'Aggregating lists!\n'
	objlist.final = izip(objlist.titles,objlist.loc,objlist.dates)
	print "Sorting lists!\n"
	objlist.finalSorted = sorted(objlist.final,key=operator.itemgetter(2), reverse=True)