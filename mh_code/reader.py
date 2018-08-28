from __future__ import print_function # Python 2/3 compatibility
import boto3
import json
import decimal
from boto3.dynamodb.conditions import Key, Attr
from reports import reports

l = []
ids = []
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('reports')

# Helper class to convert a DynamoDB item to JSON.
class DecimalEncoder(json.JSONEncoder):
    def default(self, o):
        if isinstance(o, decimal.Decimal):
            if o % 1 > 0:
                return float(o)
            else:
                return int(o)
        return super(DecimalEncoder, self).default(o)

for i in reports:
	l.append(i[0])


def lambda_handler(event,context):
	for i in l:
#		print(i)
		response = table.scan(
			FilterExpression = Key('title').eq(i),
			)
		ids.append(response['Items'][0])	
	for entry in ids:
		print(entry['report_id'])
