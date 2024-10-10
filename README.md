# GitHub Actions Terraform Template

## 概要

Terraformを手元で実行せず、GitHubとGitHub Actionsを利用してCI/CDを実現するためのテンプレートです。
terraformの実行にはOIDCを利用し、awsの認証を行うことで安全に実行基盤を整えられます。

tfstateはs3に保存され、dynamodbでロックをかけることで複数人でのtfstateの競合を防ぎます。

### リソースの追加方法

1. mainからブランチを切る
2. 必要なディレクトリを`terraform/aws`配下に作成
3. tfファイルを追加
4. GitHubでPRを作成
5. planが実行され、結果がコメントされるので確認
6. 問題なければマージ applyが実行されます
7. applyが失敗するとPRにコメントが付きます。revertするなりで対応してください

## 初期設定

### tfstate管理用のs3, dynamodb作成 && OIDC基盤の整備

この作業は手元で行う必要があります。

まずはawsをterraformから操作するためにアクセスキー、シークレットキーを設定します。

```bash
export AWS_ACCESS_KEY_ID=<YOUR_ACCESS_KEY_ID>
export AWS_SECRET_ACCESS_KEY=<YOUR_SECRET_ACCESS_KEY>
```

それぞれデプロイ

```bash
# s3, dynamodbのデプロイ
cd backend
terraform init
terraform apply --auto-approve
```

```bash
# iam, oidcのデプロイ
cd oidc
terraform init
terraform apply --auto-approve
terraform output
```

### GitHub Secretsの設定

iam, oidcのデプロイ時にoutputで出力されるarnをGitHub Secretsに設定します。

| Name | Value |
| --- | --- |
|AWS_ROLE_ARN|`terraform output で出力されるarn`|

