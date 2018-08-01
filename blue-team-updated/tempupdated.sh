#!/bin/bash
curl http://172.31.2.32:8080/wm/staticentrypusher/list/00:00:00:00:00:00:00:01/json | python -m json.tool

#SW1
curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 0, "hard_timeout": 60, "match":"eth_type:arp", "active":"true", "actions":"output=controller"}' http://172.31.2.32:8080/wm/staticentrypusher/json
