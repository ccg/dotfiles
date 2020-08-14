import argparse
import os
import sys
from collections import OrderedDict

parser = argparse.ArgumentParser()
parser.add_argument('action', help='either "append" or "prepend"')
parser.add_argument('variable',
    help='existing shell variable name (e.g., PATH) containing PATH-type, colon-delimited list (e.g., "/bin:/usr/bin")')
parser.add_argument('value', help='new value to add to the set (optionally if exists)')
#parser.add_argument('--if-exists', help='only modify the existing path variable if the new path exists')
args = parser.parse_args()

path = os.environ.get(args.variable)
path_split = path.split(':') if path else []
od = OrderedDict([x, None] for x in path_split)

action = args.action
value = args.value
if action == 'prepend':
    new_od = OrderedDict({value: None})
    new_od.update(od)
    od = new_od
elif action == 'append':
    od[args.value] = None
else:
    print('"action" must be either "append" or "prepend"')
    sys.exit(1)

print(':'.join(od.keys()))
