import urllib2
import mapcrawlobjectslist as objlist
from BeautifulSoup import BeautifulSoup


def listloop():
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
					title = node.text.encode("unicode")
					objlist.titles.append(title)
			print "Done!\n"		
