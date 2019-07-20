dateNow=$(date '+%F %T')

current=$(/usr/sbin/ioreg -l | egrep "CurrentCapacity")
current=${current#*=}

curl -d "{ \"metrics\": [{\"name\":\"MacbookProCurrentCapacity\", \"value\":\"$current\", \"timestamp\":\"$dateNow\"}] }" -H "Content-Type: application/json" -X POST https://***.execute-api.us-east-1.amazonaws.com/v1/metrics

maxCap=$(/usr/sbin/ioreg -l | egrep "MaxCapacity")
maxCap=${maxCap#*=}

curl -d "{ \"metrics\": [{\"name\":\"MacbookProMaxCapacity\", \"value\":\"$maxCap\", \"timestamp\":\"$dateNow\"}] }" -H "Content-Type: application/json" -X POST https://***.execute-api.us-east-1.amazonaws.com/v1/metrics


