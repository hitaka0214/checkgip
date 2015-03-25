# checkgip

NAT環境のPCを想定。
グローバルIPアドレスの値を確認くんのWebサイトから調べ，ChatWorkのAPIを使って通知をする。

API Tokenの発行を受けている必要がある。

# インストール方法
- Githubからソースをクローン。

``` git clone https://github.com/hitaka0214/checkgip.git ```

- Bundlerがある前提で，必要Gemをインストール。

``` cd checkgip ```

``` bundle install --path vendor/bundle ```

- 設定

main.rbを開き，ROOM_IDとCHATWORK_TOKENを設定する。


- 実行

``` bundle exec ruby main.rb ```
