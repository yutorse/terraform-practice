# Chapter2

[q]: `variable`ブロックで `default` に指定した値を参照するときに、プロパティアクセスをしなくてもいい理由は？

```
var.example_instance_type の参照は 常に可能
Terraform の変数は 必ず定義されている とみなされます

値がどこから来るかは次の優先順位で決まります:

1. CLI の -var オプション

2. .tfvars ファイルや terraform.tfvars

3. 環境変数（TF_VAR_変数名）

4. variable ブロックの default

5. どこにも値が無い場合 → apply 時にプロンプトで入力を求められる
```

[q]: プロパティへのアクセス方法は？

```
リソースの参照ルール
Terraform では次の形で参照します。

<種類またはブロックタイプ>.<ローカル識別子>.<属性>
例:
- 変数: var.example_instance_type
- ローカル値: local.example_instance_type
- データソース: data.aws_ami.latest.id
- モジュール出力: module.web_server.instance_id
```

[q]: terraform本体とプロバイダの関係は？

```
あなたの.tfコード
    ↓
Terraform本体
    - HCLを解析
    - 差分を計算
    - "EC2を作れ"という命令を生成
    ↓
AWSプロバイダ
    - AWSのEC2 APIを呼び出す
    - レスポンスを受け取ってTerraform本体に返す
    ↓
Terraform本体
    - stateファイルに新しいリソースIDや状態を書き込む
```

[q]: `file()`で呼び出すファイルのパスは、module基準か、module呼び出し元基準か？

呼び出し元の tf ファイルがあるパスを基準に解決される
