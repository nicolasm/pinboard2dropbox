#!/usr/bin/env python
# -*- coding: utf-8 -*-

from jq import jq
import json
import sys

search_value = sys.argv[1]
path_to_pinboard_json = sys.argv[2]

with open(path_to_pinboard_json) as json_file:
    json_data = json.load(json_file)

    json_search_results = jq(".[] | select((.description | contains(\"" + search_value + "\")) "
    + "or (.tags | contains(\"" + search_value + "\")) "
    + "or (.href | contains(\"" + search_value + "\")) "
    + "or (.extended | contains(\"" + search_value + "\"))) "
    + "| {description: .description, href: .href}").transform(json_data, multiple_output=True)

    for bookmark in json_search_results:
      print(bookmark["description"])
