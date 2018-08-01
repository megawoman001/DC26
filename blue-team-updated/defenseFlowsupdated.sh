#!/bin/bash
#curl -X DELETE -d '{"name":"flow-mod-1"}' http://172.31.2.32:8080/wm/staticentrypusher/json

#delete flows
curl -X DELETE -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:1", "match": "ipv4_src:10.0.0.1", "match": "ipv4_dst:10.0.0.2", "match":"eth_type:ipv4", "active":"true", "actions":"output=2"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X DELETE -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:2", "match": "ipv4_src:10.0.0.2", "match": "ipv4_dst:10.0.0.1", "match":"eth_type:ipv4", "active":"true", "actions":"output=1"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X DELETE -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match":"eth_type:arp", "active":"true", "actions":"output=1", "actions":"output=2", "actions":"output=3", "actions":"output=controller"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "eth_type:arp", "active":"true", "actions":"controller"}' http://172.31.2.32:8080/wm/staticentrypusher/json


#SW2
curl -X DELETE -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:1", "match": "ipv4_src:10.0.0.2", "match": "ipv4_dst:10.0.0.1", "match":"eth_type:ipv4", "active":"true", "actions":"output=2"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X DELETE -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:2", "match": "ipv4_src:10.0.0.1", "match": "ipv4_dst:10.0.0.2", "match":"eth_type:ipv4", "active":"true", "actions":"output=1"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X DELETE -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match":"eth_type:arp", "active":"true", "actions":"output=1", "actions":"output=2", "actions":"output=3"}' http://172.31.2.32:8080/wm/staticentrypusher/json


#SW3 no deleted flows

#end delete flows

#SW1
curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:1", "match": "eth_type:ipv4", "match": "ipv4_dst:10.0.0.2", "active":"true", "actions":""}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:1", "active":"true", "actions":"output=2"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:2", "active":"true", "actions":"output=1"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "eth_type:ipv4", "match": "ipv4_src:10.0.0.2", "active":"true", "actions":""}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match":"eth_type:arp", "active":"true", "actions":"output=1", "actions":"output=2", "actions":"output=3"}' http://172.31.2.32:8080/wm/staticentrypusher/json

#SW2
curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:1", "match": "ipv4_src:10.0.0.2", "match": "ipv4_dst:10.0.0.1", "match": "eth_type:ipv4", "active":"true", "actions":"output=3"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:3", "match": "ipv4_src:10.0.0.1", "match": "ipv4_dst:10.0.0.2", "match": "eth_type:ipv4", "active":"true", "actions":"output=1"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "eth_type:arp", "active":"true", "actions":"output=1", "action":"output=3"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "eth_type:arp", "match": "in_port:2", "active":"true", "actions":""}' http://172.31.2.32:8080/wm/staticentrypusher/json


#SW3
curl -X DELETE -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match":"in_port:1", "active":"true", "actions":""}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:1", "match": "ipv4_src:10.0.0.1", "match": "ipv4_dst:10.0.0.2", "match": "eth_type:ipv4", "active":"true", "actions":"output=2"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "in_port:2", "match": "ipv4_src:10.0.0.2", "match": "ipv4_dst:10.0.0.1", "match": "eth_type:ipv4", "active":"true", "actions":"output=1"}' http://172.31.2.32:8080/wm/staticentrypusher/json

curl -X POST -d '{"switch":"00:00:00:00:00:00:00:01", "name":"flow-mod-1", "cookie":"0", "table_id": 0, "priority":"32768", "idle_timeout": 60, "hard_timeout": 60, "match": "eth_type:arp", "active":"true", "actions":"output=1", "action":"output=2"}' http://172.31.2.32:8080/wm/staticentrypusher/json
