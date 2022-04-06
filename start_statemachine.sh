#!/bin/sh -ue
# ステートマシンを実行するサンプル。
# デプロイ後、準備として
# pip3 install -U -r requirements.txt
# ./export1.py
# で、./export.{yaml,sh} ファイルを生成の後
# このスクリプトを実行すること

. ./.export.sh

RES=$(
  aws stepfunctions start-execution \
    --state-machine-arn "$StateMachineArn" \
    --input '[1,2]'
)

echo "$RES"

executionArn=$(echo "$RES" | jq -r .executionArn)

echo "executionArn=${executionArn}" >tmp_name1.sh
