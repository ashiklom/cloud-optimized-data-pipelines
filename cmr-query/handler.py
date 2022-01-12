import datetime as dt
from cmr import GranuleQuery
import re

def handler(event, context):
    """
    Lambda handler for the NetCDF ingestion pipeline
    """
    collection = event['collection']
    version = event['version']

    enddate = dt.datetime.now()
    startdate = enddate - dt.timedelta(hours=event['hours'])
    print(f"Querying for {collection} granules from {startdate} to {enddate}")

    api = GranuleQuery()
    granules = api.short_name(collection).version(version).temporal(startdate, enddate).get_all()

    urls = []
    for granule in granules:
        for link in granule['links']:
            if link['rel'] == 'http://esipfed.org/ns/fedsearch/1.1/data#':
                href = link['href']
                if event['include']:
                    pattern = re.compile(event['include'])
                    matched = pattern.match(href)
                    if matched:
                        urls.append(href)
                else:
                    urls.append(href)
    print(f"Returning urls {urls}")
    return urls

if __name__ == '__main__':
    sample_event = {
        "hours": 6,
        "collection": "OMDOAO3",
        "version": "003",
        "include": "^.+he5$"
    }    
    handler(sample_event, {})