# research rails7 nuxt3 protobuf

## 環境構築

### 前提
- macOS(macOS Monterey 12.0.1で動作確認済み)
- homebrew インストール済み
- rbenv インストール済み
- nodenv インストール済み

### バックエンド

```
$ brew update
$ cd backend
$ brew upgrade rbenv ruby-build
$ rbenv install 3.1.0
$ rbenv local 3.1.0
$ ruby -v
ruby 3.1.0p0 (2021-12-25 revision fb4df44d16) [x86_64-darwin21]

$ bundle install --path vendor/bundle
$ bundle exec rails s
```

サーバーが起動すればok

### フロントエンド

```
$ cd frontend
$ brew upgrade yarn nodenv node-build
$ nodenv install 17.2.0
$ nodenv local 17.2.0
$ node -v
v17.2.0

$ yarn install
$ yarn dev -o
```

サーバーが起動すればok
