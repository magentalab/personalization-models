from __future__ import print_function # Python 2/3 compatibility
import boto3
import json
import decimal
from boto3.dynamodb.conditions import Key, Attr
from reports import reports

l = []

for i in reports:
	l.append(i)


def lambda_handler(event,context):

	class DecimalEncoder(json.JSONEncoder):
	    def default(self, o):
	        if isinstance(o, decimal.Decimal):
	            if o % 1 > 0:
	                return float(o)
	            else:
	                return int(o)
	        return super(DecimalEncoder, self).default(o)

	dynamodb = boto3.resource('dynamodb', region_name='us-west-2')        

	table = dynamodb.Table('reports')

	print("Movies from 1985")

	for i in l:
		table.query(
			KeyConditionExpression=Key('title').eq(i)
		)

"""
	response = table.query(
		KeyConditionExpression=Key('report_id').eq(1005821881)
	)
	print(response['Items'])
"""	
	

	

	
"""
	for i in response['Items']:
		print(i['datetime'], i['title'], i['report_id'])


	def get_table_metadata(table_name):


	    table = dynamodb_resource.Table(table_name)

	    return {
	        'num_items': table.item_count,
	        'primary_key_name': table.key_schema[0],
	        'status': table.table_status,
	        'bytes_size': table.table_size_bytes,
	        'global_secondary_indices': table.global_secondary_indexes
	    }
"""		    