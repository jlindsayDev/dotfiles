function whoseport --description 'Get process listening on specific port'


    lsof -t -i TCP:$argv[1] -s TCP:LISTEN -n -P
end

# https://news.ycombinator.com/item?id=45002676
# Get list of processes
# lsof -iTCP:2000-6000 -sTCP:LISTEN -n -P 2>/dev/null | awk 'NR>1 {print $2 "|" $1 "|" $9}' | sort -t'|' -k3 -n
