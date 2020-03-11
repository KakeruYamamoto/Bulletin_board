# README


# 技術テスト用  掲示板
### Heroku:https://infinite-falls-30864.herokuapp.com/



## 要件
[5ch](https://5ch.net/)のようなWeb掲示板を設計・作成してください。
必要な機能は以下の通りです。

1. ログイン機能 (email + pass)
2. 閲覧・投稿機能
3. スレッド機能 (スレッドにレスをつけていくスタイル)
4. カテゴリ設定 (スレッドごと / 1つのスレッドに複数付与可能)
5. 検索機能 (単語 / スレッド及びレスの横断検索)


## バージョン
- Ruby 2.6.5
- Rails 6.0.2

## 機能一覧

- [ ] ログイン機能
- [ ] ユーザ機能
- [ ] スレッド機能
- [ ] 検索機能



## カタログ設計
詳細は[こちら]()をご覧ください。

## テーブル定義
詳細は[こちら]()をご覧ください。

## ER図
詳細は[こちら]()をご覧ください。

## 画面遷移図
詳細は[こちら]()をご覧ください。

## 画面ワイヤーフレーム
詳細は[こちら]()をご覧ください。

## 使用Gem

## How to Start

```
1. $ git clone https://github.com/KakeruYamamoto/test_Bulletin_board.git
2. $ cd test_Bulletin_board
3. $ bundle install
4. $ yarn install
5. $ rails db:create
6. $ rails db:migrate
8. $ rails db:seed
9. $ bundle exec rspec
10.  rails s  
```
