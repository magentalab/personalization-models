import boto3
import csv

dynamodb = boto3.resource('dynamodb', region_name="us-west-2", endpoint_url="http://localhost:8000")

def batch_write(table_name, rows):
    table = dynamodb.table('table_name')

    with table.batch_writer() as batch:
        for row in rows:
            batch.put_item(Item=row)
    return True


def read_csv(csv_file, list):                
    rows = csv.DictReader(open('data.csv'))

    for row in rows:
        list.append(row)

if __name__ == '__main__':
    table_name = 'batch_data'        
    file_name = 'data.csv'
    items = []

    read_csv(file_name, items)
    status = batch_write(table_name, items)

    if(status):
        print("data is saved")
    else:
        print('Error while inserting data...')