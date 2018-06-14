#! /bin/bash
let nonce=0


echo "deploying ecadd caller contract"

# deploy ecadd contract
./generate_init_wasm.sh call-ecadd.wasm

node txn.js --data=txn-wasm.wasm  --nonce $nonce

let nonce=$nonce+1 

sleep 15s

echo "calling contract...."

node txn.js --data=add.dat --nonce $nonce --to 0x4cc38c3be1f9ab9436724e53d925d7fe896a2f23

sleep 15s

echo "getting result..."

echo "expected storage: "
echo "0xd3cf876dc108c2d3a81c8716a91678d9851518685b04859b021a132ee7440603"
echo "--"
echo "storage:"
./getStorage.sh 0x4cc38c3be1f9ab9436724e53d925d7fe896a2f23


