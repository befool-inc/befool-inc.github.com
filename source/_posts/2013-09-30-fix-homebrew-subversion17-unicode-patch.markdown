---
layout: post
title: "HomebrewでSubversion17をインストールする際のunicode-pathオプションでのエラー対処"
date: 2013-09-30 15:49
comments: true
categories: Mac Homebrew
author: jiska
---

森です。アクセルハンマー派生だけで村クエクリアするべく奮闘中です。

仕事の都合上 **subversion** を使うことが多いのですが、 **Homebrew** でインストールする際に
**--unicode-path** オプション指定時にエラーが出てしまい困っていたので暫定対処をしたのでその経緯をまとめました。

## お断り

この記事を書いている間に修正が入りました。ですのでこの記事の内容は過去の遺物であり現在は問題なく動作します。

以降は備忘録として閲覧ください…。

<!-- more -->

## 前提

Homebrewでそのままsubversionをインストールすると *subversion 1.8* になります。
subversion 1.8では後述の `--unicode-path` オプションが利用できないため *subversion 1.7* を使用します。
簡単にインストールしたいので *homebrew/versions* をtapして subversion 1.7用のパッケージ *subversion17* をインストールしています。

ただインストールしただけでは日本語を含んだファイル名をsvn上でうまく判断してくれないためいちいちmodified扱いになってしまいつらいです。というか使い物になりません。
そのため `--unicode-path` オプションを指定してインストールします。

```bash
$ brew tap homebrew/versions
(tapped)

$ brew info subversion17
subversion17: stable 1.7.11
http://subversion.apache.org/
Not installed
From: https://github.com/homebrew/homebrew-versions/commits/master/subversion17.rb
==> Dependencies
Build: pkg-config
Required: neon, serf, sqlite
==> Options
--java
        Build Java bindings
--perl
        Build Perl bindings
--ruby
        Build Ruby bindings
--unicode-path
        Include support for OS X UTF-8-MAC filename
--universal
        Build a universal binary
--with-homebrew-openssl
        Include OpenSSL support via Homebrew
--with-python
        Build with python support
```

## 現象

ところがいつの頃からか `--unicode-path` オプションを指定するとエラーが発生してしまいインストールが中断してしまうようになりました(´人｀)

```bash
$ brew install subversion17 --unicode-path
==> Downloading http://www.apache.org/dyn/closer.cgi?path=subversion/subversion-1.7.11.tar.bz2
==> Best Mirror http://ftp.kddilabs.jp/infosystems/apache/subversion/subversion-1.7.11.tar.bz2
######################################################################## 100.0%
==> Downloading patches

curl: (22) The requested URL returned error: 404
Error: Failure while executing: /usr/bin/curl -f#LA Homebrew\ 0.9.5\ (Ruby\ 1.8.7-358;\ Mac\ OS\ X\ 10.8.5) https://raw.github.com/gist/3044094/1648c28f6133bcbb68b76b42669b0dc237c02dba/patch-path.c.diff -o 000-homebrew.diff```
```

これは困ります。

## 対処

エラーログによると *unicode-pathのパッチを記したGistのURLが404を返してしまっている* ようです。
*subversion17* の設定を手動で変更します。

```bash
$ vi /usr/local/Library/Taps/homebrew-versions/subversion17.rb
```

```ruby
# Patch for Subversion handling of OS X UTF-8-MAC filename.
if build.include? 'unicode-path'
  ps << "https://raw.github.com/gist/3044094/1648c28f6133bcbb68b76b42669b0dc237c02dba/patch-path.c.diff"
end
```

ここを

```ruby
# Patch for Subversion handling of OS X UTF-8-MAC filename.
if build.include? 'unicode-path'
  ps << "https://gist.github.com/jeffstyr/3044094/raw/1648c28f6133bcbb68b76b42669b0dc237c02dba/patch-path.c.diff"
end
```

こうします。

再度インストールしてみます。

```bash
$ brew install subversion17 --unicode-path
==> Downloading http://www.apache.org/dyn/closer.cgi?path=subversion/subversion-1.7.11.tar.bz2
Already downloaded: /Library/Caches/Homebrew/subversion17-1.7.11.tar.bz2
==> Downloading patches
######################################################################## 100.0%
==> Patching
patching file subversion/libsvn_subr/path.c
==> ./configure --prefix=/usr/local/Cellar/subversion17/1.7.11 --with-apr=/usr/local/Library/ENV/4.3 --with-zlib=/usr --with-sqlite=/usr/local/opt/sqlite --with-serf=/usr/local/opt/serf --dis
==> make
==> make install
==> make tools
==> make install-tools
==> Caveats
This unicode-path version implements a hack to deal with composed/decomposed
unicode handling on Mac OS X which is different from linux and windows.
It is an implementation of solution 1 from
http://svn.collab.net/repos/svn/trunk/notes/unicode-composition-for-filenames
which _WILL_ break some setups. Please be sure you understand what you
are asking for when you install this version.


Bash completion has been installed to:
  /usr/local/etc/bash_completion.d
==> Summary
🍺  /usr/local/Cellar/subversion17/1.7.11: 106 files, 8.1M, built in 4.8 minutes
```

```bash
$ svn --version
svn, version 1.7.11 (r1503888)
   compiled Sep 30 2013, 18:00:03
```

無事にインストールできました！

## 原因とPull Requests

詳細なソースが見当たらないのですが [GistのURL形式が変更になった](https://github.com/blog/1406-namespaced-gists) のですが、
いままで旧形式URLにアクセスしても新形式のURLにリダイレクトをしてくれていたのが
ある日を堺にリダイレクトをかけずに404を返すようになったのかな、と憶測しています。

とりあえず上記の件は[URLを変更するPull Requestを投げました](https://github.com/Homebrew/homebrew-versions/pull/218)。
無事通るといいな。

*18:53 09-30-2013 追記 → 無事にコミットされました* 。 [173b764c6b051144b23e01eb662896659f092eff](https://github.com/Homebrew/homebrew-versions/commit/173b764c6b051144b23e01eb662896659f092eff)

