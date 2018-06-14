#!/bin/bash

echo $1
curl -X POST --data "{\"jsonrpc\":\"2.0\", \"method\": \"eth_getStorageAt\", \"params\": [\"$1\", \"0x0\", \"latest\"], \"id\": 1}" localhost:8545

