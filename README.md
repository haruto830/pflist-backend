# pflist-backend

## 開発環境セットアップ

```bash
# リポジトリのクローン
$ git clone https://github.com/haruto830/pflist-backend.git
$ cd pflist-backend

# ビルド
$ docker-compose build

# コンテナ起動
$ docker-compose up -d

# DBマイグレーション
$ docker-compose exec -w /go/src/app/sql app go run migrate.go -exec up

# テストデータ登録
$ docker-compose exec -w /usr/share/mysql db sh -c "mysql -u root -p pflist < testdata.sql"
```

## 動作確認

|    サービス    |                  確認方法                  |
| -------------- | ------------------------------------------ |
| app (API)      | http://localhost:8000                      |
| db (MySQL)     | IP: 127.0.0.1, port:3306, database: pflist |
| Swagger UI     | http://localhost:8081                      |
| Swagger Editor | http://localhost:8082                      |

## ディレクトリ構成

```bash
$ tree -F --dirsfirst -L 2
.
├── app/  # ソースフォルダ
│   ├── sql/
│   ├── Dockerfile
│   ├── go.mod
│   ├── go.sum
│   └── main.go
├── configs/ # 環境設定
│   └── mysql/          
├── data/ # DBデータ管理
│   ├── mysql_data/ 
│   └── test_data/ 
├── doc/  # ドキュメント
│   ├── diagrams/ 
│   ├── specificDesign/ 
│   └── swagger.yaml
├── README.md
└── docker-compose.yml

```

# ドキュメント
- [DB設計書](https://docs.google.com/spreadsheets/d/1iMfJs2HEjGA5TPjG-f6Zk9jXMCtfcMBnUZOB_DXmY8M/edit?usp=sharing)

- [詳細設計](https://github.com/haruto830/pflist-backend/tree/master/doc/specificDesign)