#!/bin/python3

"""
Takes YAML input on stdin directly from khard and formats it nicely for rofi
"""

import sys
import yaml

yaml_doc = ""
for line in sys.stdin:
    yaml_doc = yaml_doc + "\n" + line
contact = yaml.safe_load(yaml_doc)

# Format is field: value, but flattened and prettified
fields = [
        ("name", contact.get("Formatted name")),
        ]


def extract_listed_details(key, source, fields):
    """Takes a list of contact details and formats into k,v pairs"""
    if source is not None:
        for label in source:
            name = key + "(" + label + ")"
            val = source.get(label)
            fields.append((name, val))


extract_listed_details("email", contact.get("Email"), fields)
extract_listed_details("phone", contact.get("Phone"), fields)

for field in fields:
    print(field[0] + ": " + field[1])
