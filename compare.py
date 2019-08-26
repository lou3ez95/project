#!/usr/bin/python
import json
import sys

def compare(data):

    for i in data['Destination']:
        result = i['details']
        ch1 = "Connection closed by foreign host"
        i['details'] = ''
         
        if result != ch1:
            i['Status'] = "Not Ok"
            i['details'] = result
        else:
            i['Status'] = "Connected"
	    del i['details']	
		 
    return data


with open(sys.argv[1], 'r') as f:
    file_data = json.load(f)

data = compare(file_data)

with open(sys.argv[1], 'w') as f:
    json.dump(data, f)

