#!/bin/bash

curl http://172.31.2.32:8080/wm/staticentrypusher/list/00:00:00:00:00:00:00:01/json | python -m json.tool

#SW1
curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:1", "match": "ipv4_src:10.0.0.1", "match": "ipv4_dst:10.0.0.2", "match":"eth_type:ipv4", "active":"true", "actions":"output=2"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:2", "match": "ipv4_src:10.0.0.2", "match": "ipv4_dst:10.0.0.1", "match":"eth_type:ipv4", "active":"true", "actions":"output=1"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "eth_type:arp", "actions": "output:1", "action": "output:2", "action": "output:3", "active":"true"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:1", "match": "eth_type:ipv4", "match": "ipv4_dst:10.0.0.2", "actions": "", "active": "true"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "eth_type:ipv4", "match": "ipv4_src:10.0.0.2", "actions": "", "active": "true"}' http://172.31.2.32:8080/wm/staticentrypusher/json

#SW2

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:1", "match": "ipv4_src:10.0.0.2", "match": "ipv4_dst:10.0.0.1", "match":"eth_type:ipv4", "active":"true", "actions":"output=2"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:2", "match": "ipv4_src:10.0.0.1", "match": "ipv4_dst:10.0.0.2", "match":"eth_type:ipv4", "active":"true", "actions":"output=1"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match":"eth_type:arp", "active":"true", "actions": "output:1", "action": "output:2", "action": "output:3"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:1", "match": "ipv4_src:10.0.0.2", "match": "ipv4_dst:10.0.0.1", "match":"eth_type:ipv4", "active":"true", "actions":"output=3"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:3", "match": "ipv4_src:10.0.0.1", "match": "ipv4_dst:10.0.0.2", "match":"eth_type:ipv4", "active":"true", "actions":"output=1"}' http://172.31.2.32:8080/wm/staticentrypusher/json


#SW3
#STP loop killer
curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:3", "action": ""}' http://172.31.2.32:8080/wm/staticentrypusher/json

#drop honey
curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0xbad", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:1", "action": ""}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:1", "match": "ipv4_src:10.0.0.1", "match": "ipv4_dst:10.0.0.2", "match":"eth_type:ipv4", "active":"true", "actions":"output=2"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:2", "match": "ipv4_src:10.0.0.2", "match": "ipv4_dst:10.0.0.1", "match":"eth_type:ipv4", "active":"true", "actions":"output=1"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match":"eth_type:arp", "active":"true", "actions":"output=1"}' http://172.31.2.32:8080/wm/staticentrypusher/json
