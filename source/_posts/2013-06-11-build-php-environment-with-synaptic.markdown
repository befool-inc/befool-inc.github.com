---
layout: post
title: "SynapticでPHP開発環境を構築しよう"
date: 2013-06-11 08:00
comments: true
categories: debian
author: jiska
---

森です。 [前回の記事](/blog/2013/06/08/start-desktop-linux-on-virtualbox/) で仮想環境を作成したわけですが
作成しただけでは何も始まりません。さっそく開発環境を構築していきましょう。

今回は伝統的な *Apache* , *PHP* , *MySQL* 構成を構築します。

あいかわらずスクリーンショット多め内容薄めです。

## パッケージ管理にSynaptic パッケージマネージャを使う

Debianにはソフトウェアをインストール、管理するためにあらかじめ用意された
多くの [パッケージ](http://www.debian.org/distrib/packages.ja.html) があります。
これらのパッケージを用いることでApacheやMySQLなど一般的なソフトウェアのインストールやアップデート、削除をとても簡単に行えます。
かんたんに開発環境を構築するために使わない手はありません。

さらに **Synaptic パッケージマネージャ** （以降Synaptic）を使用することでパッケージをGUIで追加、更新、削除することができます。
今回はSynapticを用いてソフトウェアのインストールを行います。

Synapticの詳細は [packages.debian.orgを参照](http://packages.debian.org/ja/squeeze/synaptic) してください。

## Synapticの起動

まず *スタートメニュー* から *システムツール* → *システム管理* → *Synaptic パッケージマネージャ* を選択します。
Synapticの起動には **rootのパスワードを入力する** 必要がありますので前回インストール時に設定したパスワードを入力してください。

![選択](/images/posts/2013-06-11-build-php-environment-with-synaptic/boot-synaptic.choose.png)

![パスワード入力](/images/posts/2013-06-11-build-php-environment-with-synaptic/boot-synaptic.password.png)

初回起動時にはSynapticのかんたんな説明が表示されます。よく読んでおきましょう。

![Synapticの説明](/images/posts/2013-06-11-build-php-environment-with-synaptic/boot-synaptic.confirm.png)

## パッケージをインストールする

Synapticのメイン画面です。

左ペイン で *インストールするパッケージのカテゴリ* を選び、 右ペインで 表示される *パッケージ* をチェックして *適用* ボタンを押すとシステムに反映されます。
目的のパッケージ名がわかっている場合は **名前からパッケージを検索する** こともできます。

![Synapticメイン画面](/images/posts/2013-06-11-build-php-environment-with-synaptic/synaptic.main.png)

### Apache

まずはApacheのインストールです。
*検索* 欄に ```apache2``` と入力します。関連するパッケージが表示されますので **apache2** をダブルクリックでインストール指定をします。

![Apacheインストール](/images/posts/2013-06-11-build-php-environment-with-synaptic/synaptic.install-apache2.png)

注意が表示されました。一部のパッケージには **依存関係** があり、パッケージAをインストールするためにはパッケージBのインストールが必要なケースや、
パッケージAをインストール指定するとパッケージCが削除されるというケースもあります。
今回は *apache2* をインストール指定すると *apache2-mpm-worker* , *apache2-utils* , *apache2.2-common* が合わせてインストール指定されます。

*マーク* ボタンをクリックしてパッケージ選択画面に戻ります。

![依存パッケージの選択](/images/posts/2013-06-11-build-php-environment-with-synaptic/synaptic.install-apache2.notice.png)

### PHP

次は *PHP* をインストール指定します。先ほどと同じ要領で ```php``` でパッケージを検索します。
一覧から **php5** を選択します。また依存パッケージの注意が表示されるのでパッケージを確認して *マーク* ボタンをクリックします。

### MySQL

最後に *MySQL* です。 **mysql-server** とPHPでMySQLへ接続するために **mysql-php5** を、 さらにブラウザ上でデータベースを操作するために **phpmyadmin** をインストール指定します。

### インストール

これですべての準備ができました。 **適用** ボタンをクリックします。

インストールするパッケージの確認が表示されます。内容を確認した上で **適用** ボタンをクリックします。

![パッケージの確認](/images/posts/2013-06-11-build-php-environment-with-synaptic/synaptic.install.confirm.png)

パッケージのダウンロードが始まります。ゆっくり待ちましょう。

![ダウンロード中](/images/posts/2013-06-11-build-php-environment-with-synaptic/synaptic.install.download.png)

インストール中に他ソフトウェアの設定画面が表示されることがあります。今回はMySQLサーバとphpMyAdminの設定画面が表示されます。

MySQLサーバのrootのパスワードを指定しましょう。

![mysqlの設定](/images/posts/2013-06-11-build-php-environment-with-synaptic/synaptic.install.setup-mysql.png)

phpMyAdminの設定では *apache2* を選択します。他にも選択を要求されることがあるかもしれませんが画面の指示にしたがって選択していけばダイジョブです。

![phpMyAdminの設定](/images/posts/2013-06-11-build-php-environment-with-synaptic/synaptic.install.setup-phpmyadmin.png)

あとはインストールが終わるまでゆっくり待ちましょう。

![インストール中](/images/posts/2013-06-11-build-php-environment-with-synaptic/synaptic.install.processing.png)

無事完了したようです。

![インストール完了](/images/posts/2013-06-11-build-php-environment-with-synaptic/synaptic.install.finish.png)

## 試してみよう

*スタートメニュー* から *インターネット* → *Iceweasel ウェブ・ブラウザ* を選択します。

※ *Iceweasel* は標準でインストールされているWebブラウザです。

![Iceweaselを選択](/images/posts/2013-06-11-build-php-environment-with-synaptic/boot-iceweasel.choose.png)

アドレスバーに ```http://localhost/phpmyadmin``` と入力します。
phpMyAdminのログイン画面が表示できました。

ユーザ名に **root** , パスワードに **先ほどの手順で設定したパスワード** を入力してログインします。

![phpMyAdminログイン画面](/images/posts/2013-06-11-build-php-environment-with-synaptic/phpmyadmin.login.png)

メイン画面が無事に表示されればもう問題はなさそうです。

![phpMyAdminメイン画面](/images/posts/2013-06-11-build-php-environment-with-synaptic/phpmyadmin.main.png)

これで *Apache* , *PHP* , *MySQL* の環境が構築できました。これでアプリを作っていきましょう！

## 終わりに

Synapticを使うことでターミナルを使わずに開発環境を用意することができました。
ゆくゆくはCUIを使う必要があるのですが、まずはSynapticを使って環境構築の敷居を下げ、いろいろなパッケージを試していきましょう。
