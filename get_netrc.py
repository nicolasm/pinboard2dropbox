#!/usr/bin/env python
import netrc
import sys

machine = sys.argv[1]
login = netrc.netrc().authenticators(machine)
if not login:
    sys.exit(machine + ' not found in netrc!')

# Format as bash array.
print login[0] + " " + login[2]