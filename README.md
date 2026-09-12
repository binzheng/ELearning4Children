# ELearning4Children

子供向けのeラーニングアプリケーションです。算数の計算問題（足し算、引き算、掛け算）を練習できます。

## 機能

- ユーザー登録・ログイン
- 算数の問題出題（足し算、引き算、掛け算）
- 学習履歴の記録
- 成績の確認

## 技術スタック

- Ruby on Rails 5.x
- SQLite3 (開発環境)
- Bootstrap

## セットアップ

### 必要条件

- Ruby 2.4以上
- Rails 5.x
- Node.js
- SQLite3

### インストール

```bash
# リポジトリをクローン
git clone https://github.com/binzheng/ELearning4Children.git
cd ELearning4Children

# 依存関係をインストール
bundle install

# データベースをセットアップ
rails db:create
rails db:migrate
rails db:seed

# サーバーを起動
rails server
```

### 環境変数

本番環境では以下の環境変数を設定してください：

```bash
export SECRET_KEY_BASE=your_secret_key_here
```

## 使い方

1. ブラウザで `http://localhost:3000` にアクセス
2. ユーザー登録またはログイン
3. 問題タイプを選択して学習開始

## ライセンス

MIT License
