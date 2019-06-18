# pflist-backend

## ディレクトリ構成
```bash
$ tree --dirsfirst -L 1
.
├── app      # ソースファイル
├── configs  # 環境設定
├── data     # DBデータの保管場所
├── doc      # 各種ドキュメント
├── scripts  # セットアップスクリプト
├── README.md
├── docker-compose.yml
└── swagger.yaml
```

## 開発環境セットアップ

```bash
# ビルド
$ docker-compose build

# コンテナ起動
$ docker-compose up -d

# コンテナ稼働状況
$ docker-compose ps

# コンテナ停止
$ docker-compose down
```