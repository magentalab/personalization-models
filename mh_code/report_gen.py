from datetime import datetime, timedelta
from reports import reports, now
import omniture
import boto3

def lambda_handler(event, context):
    
	 #initialize dynamodb tables
	dynamodb = boto3.resource('dynamodb')
	table = dynamodb.Table('reports')

	#log in and get report suite
	un = "APIteam:T-Mobile USA"
	sec ="936bf8cd2f1964e19e87ad81d7e04c32"
	analytics = omniture.authenticate(un,sec)
	tmobusprod = analytics.suites["tmobusprod"]

	#create reports and write to array
	for i in reports:
		try: 
			report = tmobusprod.jsonReport(i[1]).async();
			while (report.check() == False):
					report.check()	
			else:
				table.put_item(
					Item={
						'title': i[0],
						'report_id': getattr(report,"id"),
						'datetime': str(now)
					}
				)
		except KeyError:
			continue		