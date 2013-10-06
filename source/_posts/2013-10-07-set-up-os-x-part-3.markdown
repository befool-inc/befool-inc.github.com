---
layout: post
title: "自分用のOS X設定 その３"
date: 2013-10-07 02:00
comments: true
categories: Mac Homebrew
author: jiska
---

森です。第１回にて[２つの記事に分けて記述します](/blog/2013/08/12/set-up-os-x-part-1/)といいましたが…まとめきれず３つ目の記事になってしまいました。

今回は **Homebrew** を用いて **git** . **subversion** , **rbenv** などなど自分の開発環境セットアップ方法をまとめます。

このまとめを書いている自分のMacは **MacBook Air 11-inch Mid 2011** 、 **OS X 10.8.4** です。
そのため他の機種、OSのバージョンではこのとおりの設定はできないかもしれませんのでご了承ください。

![my OS X](/images/posts/2013-08-12-set-up-os-x-part-1/my_os_x.png)

<!-- more -->

## Homebrew

[Homebrew](http://brew.sh/index_ja.html) とはMacのパッケージ管理ツールです。
最近は情報を探すときに Homebrew をやたら進められるので自分も乗っかっています。

他にも有名なパッケージ管理ツールには **MacPorts** がありますが自分はMac歴が浅くて使ったことがないのです…。

Homebrewのインストールは簡単です。ターミナルに下記コマンドを流すだけです。

```bash
$ ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
```

インストールは簡単にできましたが、使用するにはもう一手間必要で、 *Command Line Tools for Xcode* か *Xcode* をインストールする必要があります。
自分はXcodeを使っていないのでCommand Line Tools for Xcodeを使用しています。

[Apple Developer](https://developer.apple.com/downloads/index.action) で *Xcode* で検索してインストール用のdmgをダウンロードしてください。

![Download Command Line Tools for Xcode](/images/posts/2013-10-07-set-up-os-x-part-3/download-command-line-tools-for-xcode.png)

ダウンロードするにはApple IDが必要ですので別途登録しておきましょう。

インストールの詳細は [wiki](https://github.com/mxcl/homebrew/wiki/Installation) を参照してください。

インストールが完了したら以降は下記コマンドでHomebrewのパッケージをインストールできます。

```bash
$ brew install [package]
```

次はHomebrewを利用してインストールするツール群の説明です。

### bash-completion

とりあえずターミナルの補完を有効にしたいので *bash-completion* をインストールします。

```bash
$ brew install bash-completion
```

インストール後は `$HOME/.profile` に下記設定を追加して補完設定を読み込むようにします。

```bash
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi
```

`source $HOME/.profile` するかターミナルを再起動して設定を反映しておきましょう。

### Git

インストール必須ですね。

```bash
$ brew install git
```

gitで日本語ファイル名が数字で表示されてしまうので（そもそも日本語ファイル名を使うなというツッコミはありますが）gitconfigに下記設定を追加します。

```bash
$ git config --global core.quotepath false
```

あとはお好みでgitconfigを弄ればいいでしょう。
自分のgitconfigはこんなかんじです。 [jiskaのgitconfig](https://github.com/jiska/dotfiles/blob/master/.gitconfig)

さらにGitのブランチ名をターミナルに表示したいので
`$HOME/.profile` に下記設定を追加してます。

```bash
PS1='\u:\w\$ $(__git_ps1 "[%s] ")'
```

### Subversion

[別の記事](/blog/2013/09/30/fix-homebrew-subversion17-unicode-patch/)でも触れているのですが
自分は *unicode-path* オプションを利用したいので **Subversion 1.7** を使用しています。

Homebrewの標準レポジトリではコマンド１発でSubersion 1.7系をインストールすることができません。
そこで **homebrew/versions** をtapして **subversion17** をインストールします。
unicode-pathオプションも忘れずに。

```bash
$ brew tap homebrew/versions
$ brew install subversion17 --unicode-path
```

### rbenv

Rubyもちょっとしたワンライナー書いたり便利ツール作ったりするときに使ってます。

```bash
$ brew install rbenv ruby-build
```

例によって下記設定を `$HOME/.profile` に追加します。

```bash
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
```

### PHP

今現在PHPを用いた開発のお仕事をしていますがMac上でPHPアプリケーションを動かすことがほとんどありません…
開発する場合はVMに環境構築してます。

それでもローカルでちょっと確認したいなって場合があるのでPHPをインストールしてます。

HomebrewでPHPをインストールするために [josegonzalez/homebrew-php](https://github.com/josegonzalez/homebrew-php) をtapしています。

インストールオプションはお好みで。あとWebサーバーは *Nginx* 使ってますのでNginxもインストールしときます

```bash
$ brew tap homebrew/dupes
$ brew tap josegonzalez/homebrew-php
$ brew install php54 --without-apache --with-fpm
$ brew install nginx
```

## 最後に

自分の開発環境のセットアップ手順のまとめみたいなものをツラツラと書き続けてきましたがようやくひとまとまりしました。
正直、上記の手順がめんどくさいので自動でセットアップをしたいなあと思うこのごろ。

[Boxen](http://boxen.github.com/) を使って今までの手順をレシピにして開発環境のセットアップ自動化してみようとおもいます。