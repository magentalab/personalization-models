import urllib2
from BeautifulSoup import BeautifulSoup
from itertools import izip
import csv
import operator
import mapcrawlobjectslist as objlist

with open("sitemapurlslist.txt", "r") as maplist:
	for eachurl in maplist:
		print "Processing " + eachurl	
		map2crawl = eachurl
		data = urllib2.urlopen(map2crawl).read()
		soup = BeautifulSoup(data)

		for node in soup.findAll('loc'):
			url = node.text.encode("utf-8")
			objlist.loc.append(url) 

		for node in soup.findAll('lastmod'):
			date = node.text
			objlist.dates.append(date) 

		for url in objlist.loc:
			urldata = urllib2.urlopen(url).read()
			urlsoup = BeautifulSoup(urldata)
			for node in urlsoup.findAll("title"):
				title = node.text.encode("utf-8")
				objlist.titles.append(title)
		print "Done!\n"		

print 'Aggregating lists!\n'
final = izip(objlist.titles,objlist.loc,objlist.dates)
print "Sorting lists!\n"
finalSorted = sorted(final,key=operator.itemgetter(2), reverse=True)

csvfile = "exploreurls.csv"
print "Writing CSV!\n"
with open(csvfile, "wb") as file:
	writer = csv.writer(file)
	writer.writerow(["titles","urls","date_modified"])
	writer.writerows(finalSorted)
print "Done!"


