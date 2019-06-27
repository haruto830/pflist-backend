# Put ListIdAPIの詳細設計書

## 概要
指定したポートフォリオIDの情報を更新するAPI

## シーケンス図
![putListId](../diagrams/putListId.png)

## API仕様書
http://localhost:8082/#/List/delete_list__portfolioId_

## ワークフロー
- 認証チェック
  - FirebaseにTokenを確認
  - Tokenエラーの場合は401を返す

- バリデーションチェック

    |     項目      | 必須 | 文字数  |
    | ------------- | ---- | ------- |
    | portfolioId   | ○    | ×       |
    | images        | ○    | ×       |
    | title         | ○    | <= 100  |
    | overview      | ○    | <= 500  |
    | detail        | ○    | <= 4000 |
    | skills        | ○    | ×       |
    | url.github    | ○    | ×       |
    | url.portfolio | ×    | ×       |
    | url.blog      | ×    | ×       |
    | userAccount   | ○    | ×       |
    | userIcon      | ○    | ×       |
    | status.term   | ×    | <= 3    |
    | status.state  | ○    | ×       |

- 更新対象チェック
  - portfolioIdとuserIdを条件として更新可能なportfolioがあるかを確認
    - 更新可能なportfolioがない場合は、404を返す

- S3に画像を保存
    - 保存先パス：pflist-img/portfolio/
    - ファイル名：{userAccount}_{UUID}

- リクエストの各項目の内容で更新を行う
    - portfoliosテーブルは、各項目UPDATEをする
    - skillsテーブルは、既存データをDELETEし、リクエストのSkill項目をINSERTをする
    - imagesテーブルは、既存データをDELETEし、リクエストのImages項目をINSERTをする

- 200を返す

