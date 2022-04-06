# sam-stepfunctions-parallel

AWS Step Functions の parallel と map のサンプル。

## 参考

- [AWS Step FunctionsのParallelステートを使って並列実行させる | DevelopersIO](https://dev.classmethod.jp/articles/aws-step-functions-parallel-execution/)


# デプロイ

```sh
sam build
sam deploy --guided  # --guidedは最初の1回
```

`sam deploy --guided` は
デフォルトでいいです。

デプロイが終わったら
```sh
pip3 install -U --user -r requirements.txt
./export1.py
```

と、実行すると、Step FunctionsのARNなどが
- `.export.yml`
- `.export.sh`

に書き出されます。


# テストの実行

```sh
./start_statemachine.sh       # Step Functionの起動
./get_statemachine_status.sh  # Step Functionの結果の取得
sleep 10   # ASLでわざと10秒待つように作ってある
./get_statemachine_status.sh  # Step Functionの結果の取得
```


# スタックの削除

```sh
sam delete --no-prompts
```
で消えます。
