import argparse
import os
import sys
from collections import OrderedDict

class OrderedSet:
    def __init__(self, values):
        self.ordered_dict = OrderedDict([value, None] for value in values)

    def prepend(self, value):
        # Inefficient implementation
        new_od = OrderedDict({value: None})
        new_od.update(self.ordered_dict)
        self.ordered_dict = new_od

    def append(self, value):
        self.ordered_dict[value] = None

    def values(self):
        return self.ordered_dict.keys()

parser = argparse.ArgumentParser()
parser.add_argument('action', help='either "append" or "prepend"')
parser.add_argument('variable',
    help='existing shell variable name (e.g., PATH) containing PATH-type, colon-delimited list (e.g., "/bin:/usr/bin")')
parser.add_argument('value', help='new value to add to the set (optionally if exists)')
#parser.add_argument('--if-exists', help='only modify the existing path variable if the new path exists')
args = parser.parse_args()

env_path = os.environ.get(args.variable)
existing_paths = env_path.split(':') if env_path else []

paths = OrderedSet(existing_paths)

action = args.action
value = args.value
if action == 'prepend':
    paths.prepend(value)
elif action == 'append':
    paths.append(value)
else:
    print('"action" must be either "append" or "prepend"')
    sys.exit(1)

print(':'.join(paths.values()))
