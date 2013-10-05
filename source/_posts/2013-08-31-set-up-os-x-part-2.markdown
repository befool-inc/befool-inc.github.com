---
layout: post
title: "自分用のOS X設定 その２"
date: 2013-08-31 10:00
comments: true
categories: OS_X
author: jiska
---

森です。前回にmacの設定をまとめましたが今回は自分が使っているソフトウェアを紹介します。

このまとめを書いている自分のMacは **MacBook Air 11-inch Mid 2011** 、 **OS X 10.8.4** です。
そのため他の機種、OSのバージョンではこのとおりの設定はできないかもしれませんのでご了承ください。

![my OS X](/images/posts/2013-08-12-set-up-os-x-part-1/my_os_x.png)

<!-- more -->

## ユーティリティ

### XtraFinder

![XtraFinder](/images/posts/2013-08-31-set-up-os-x-part-2/XtraFinder.png)
[ダウンロード](http://www.trankynam.com/xtrafinder/)

mac標準のファイラーのFinderを拡張するソフトウェアです。Finderの操作が自分にはどうにも使いづらいので必須です。

Finderでは ファイル（ディレクトリ）選択時に *command + ↓* で選択項目を開きます、*return* だと選択項目のリネームです。
これが自分には全く馴染めません…。

**Return で選択項目を開く** にチェックを入れます。
代わりにリネームを有効にするため **名前変更** に好きなキーボードショートカットを割り当てましょう。
自分は *command + return* にしています。

![XtraFinderの設定](/images/posts/2013-08-31-set-up-os-x-part-2/XtraFinder-setting.png)

### iTerm 2

![iTerm 2](/images/posts/2013-08-31-set-up-os-x-part-2/iTerm-2.png)
[ダウンロード](http://www.iterm2.com/)

標準のターミナルよりも多機能で色々設定ができます。

全角文字の表示崩れを防ぐために **Treat ambiguous-width characters as double width** にチェックをいれます。

![iTerm 2の設定](/images/posts/2013-08-31-set-up-os-x-part-2/iTerm-2-setting.png)

### AppCleaner

![AppCleaner](/images/posts/2013-08-31-set-up-os-x-part-2/AppCleaner.png)
[ダウンロード](http://www.freemacsoft.net/appcleaner/)

macで色々ソフトウェアをインストールして試し、
使わなくなったソフトウェアをアンインストール（といっても */Applications* から削除するだけですが）しても
不要ファイルが残ってしまいます。

AppCleanerを使えば不要ファイルも一緒にアンインストールしてくれるので楽です。

### The Unarchiver

![The Unarchiver](/images/posts/2013-08-31-set-up-os-x-part-2/The-Unarchiver.png)
[ダウンロード](https://itunes.apple.com/en/app/the-unarchiver/id425424353)

mac標準の解凍ツールではwindowsで作成されたzipファイルを解答できない場合があります。

The Unarchiverなら問題なく解答できます。

### FileZilla

![FileZilla](/images/posts/2013-08-31-set-up-os-x-part-2/FileZilla.png)
[ダウンロード](https://filezilla-project.org/)

FTP, SFTPクライアントです。最近は使う機会が減りましたがたまにSFTPでファイルを複数やりとりするときに使います。

## テキストエディタ

### mi

![mi](/images/posts/2013-08-31-set-up-os-x-part-2/mi.png)
[ダウンロード](http://www.mimikaki.net/)

標準のテキストエディタはいろいろ心もとないのです…。
自分はβ版の **mi テキストエディタ バージョン 3.0.0b3** を使用しています。

## IDE

### PhpStorm

![PhpStorm](/images/posts/2013-08-31-set-up-os-x-part-2/PhpStorm.png)
[ダウンロード](http://www.jetbrains.com/phpstorm/)

PHPのIDEとして自分には必須です。もはやPhpStormがないと複数ファイルを扱うプロジェクトの開発ができない体になってしまいました。
初年 **$99** 、翌年から **$49** かかりますがそれ以上の価値は間違いなくあります。

日本の公認代理店の [サムライズムさん](http://samuraism.com/products/jetbrains/phpstorm) で日本円で購入することもできるみたいです。

## だいたいこんなところ

他には *Google Chrome* や *Google 日本語入力* 、 *RubyMine* を使ってますが紹介は割愛します。

次は [Homebrew](http://brew.sh/index_ja.html) を使って **tmux** やら **git** やら **subversion** やらをインストールする方法を説明しますが長くなってきたので一旦区切ります。
無念。