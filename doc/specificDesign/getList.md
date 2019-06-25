# Get ListAPIの詳細設計書

## 概要
ポートフォリオ一覧情報を返すAPI

## シーケンス図
![getList](../diagrams/getList.png)

## API仕様書
`http://localhost:8082/#/List/get_list`

## ワークフロー
1. DBから値を取得
2. swagger仕様書に沿ってレスポンスを作成
3. 200を返す
4. フロントからS3にリクエストし、画像を取得
