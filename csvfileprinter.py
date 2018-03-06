import urllib2
from BeautifulSoup import BeautifulSoup
from itertools import izip
from listloop import listloop
from sortaggregate import sortlists
import csv
import operator
import mapcrawlobjectslist as objlist

def makeFile():
	csvfile = "exploreurls.csv"
	print "Writing CSV!\n"
	with open(csvfile, "wb") as file:
		writer = csv.writer(file)
		writer.writerow(["titles","urls","date_modified"])
		writer.writerows(objlist.finalSorted)
	print "Done!"
