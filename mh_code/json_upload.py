from __future__ import print_function # Python 2/3 compatibility
import boto3
import json
import decimal

dynamodb = boto3.resource('dynamodb', region_name='us-west-2', endpoint_url="http://localhost:8000")

table = dynamodb.Table('reports_2')

f = open('reports_2.json')
request_items = json.loads(f.read())
client = boto3.client('dynamodb')
response = client.batch_write_item(RequestItems=request_items)