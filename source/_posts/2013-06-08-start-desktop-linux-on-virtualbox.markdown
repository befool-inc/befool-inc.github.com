---
layout: post
title: "Oracle VM VirtualBoxでデスクトップLinuxを始めよう"
date: 2013-06-08 10:00
comments: true
categories: virtualbox
author: jiska
---

森です。他メンバーはUnityのことばっかり書いていますがマイペースで書きます。

昔 [windowsでwebサービスの開発をしているひとにUbuntuをオススメしたい３つの理由](http://d.hatena.ne.jp/jiskay/20101123/1290527829) を書いたわけですが
今となっては古い情報になりつつあるので改めて。

## はじめに

大多数のwebサービスは *Linux系OS* で動作しています。webサービスを開発、運用する上でLinuxを操作することを避けては通れません。
前述の記事は *Windows* は使い慣れているけれどLinuxの仕組みはよくわからない…という人に向けて
*それじゃあデスクトップLinuxを使ってLinuxに慣れてみようよ* という意図でかいたものです。

親しみのあるWindows環境を捨てて新しい環境へ移行するというのは中々勇気が要ることです。
そこで *既存の環境を壊さずに別環境を試す* ために *仮想化ソフトウェア* の出番です。
1つのマシンで複数の *仮想マシン* を動作させることができます。
ここ2~3年のマシンならば必要に応じて仮想マシンを新規作成、起動、いらなくなったら削除する…ということを気楽に行えます。

今回は仮想化ソフトウェアに **Oracle VM VirtualBox** （以降VirtualBox）を使用して仮想環境を作成します。

※ スクリーンショットなどは自分が現在 *Mac* (OS X) を使用しているのでMac版になってしまいますが、
Windows版でも大きな違いはありませんので適時読み替えてください。ごめんなさい。

<!-- more -->

## VirtualBox をインストールする

[VirtualBoxのダウンロードページ](http://www.oracle.com/technetwork/jp/server-storage/virtualbox/downloads/index.html) から
自分が使っているプラットフォームに合わせたインストーラをダウンロード、VirtualBoxをインストールしましょう。

インストールが終わったらVirtualBoxを起動しましょう。メイン画面はこんなかんじです。

![main](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/main.png)

まだ *仮想マシン* が何も登録されていません。作成済みの仮想マシンをインポートすることもできますが、今回は新規で仮想マシンを作成しましょう。

## 仮想マシンを新規作成する

仮想マシンの作成概要をかいつまむと

1. 仮想マシンを作成する
1. 仮想マシンの設定を調整する
1. 仮想マシンにOSをインストールする

…これだけです。画面の指示にしたがって作業を進めればOSのインストールまでおよそ1時間程度で仮想マシンが完成します。

### 仮想マシンの作成

左上の *新規* ボタンを押すと *新規作成ウィザード* が起動します。

![新規作成ウィザード](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/create-wizard.name.1.png)

まず作成する仮想マシンの名前を入力します。 **自分が管理しやすい、わかりやすい名前** をつけてください。
このときに名前を *Debian* などにすると仮想マシンの設定をあらかじめ自動で選択してくれます。

![仮想マシンの名前を入力する](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/create-wizard.name.2.png)

仮想マシンのメモリ割り当て量を設定します。自分のマシンスペックと相談して割り当てて下さい。
あまり深く考えずにデフォルト値を選択しても大丈夫です。

![メモリ割り当て量を設定する](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/create-wizard.memory.png)

ハードディスクイメージを作成するか、すでに存在するイメージを割り当てるか選択します。
今回は新規作成です。

![ハードディスクイメージを作成する](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/create-wizard.hd.png)

新規作成する場合はハードディスクイメージの種類や容量の設定を設定する項目が表示されます。
これらもデフォルト値のままで大丈夫です。細かい項目は何回か仮想マシンを作成するようになってから調べるのでも充分です。

メイン画面に先ほど命名した仮想マシンが登録されれば完了です。

![仮想マシン登録完了](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/added.png)

### OSのインストール

作成した仮想マシンにOSをインストールします。
インストールをするOSとして無数にあるLinuxディストリビューションからどれを使うかは個人の好みによるものが大きいと思うのですが、
今回は [Debian](http://www.debian.org/) でいきます。理由は単純に自分がDebianが好きだからです。
実業務で利用しているLinuxディストリビューションがRed Hat系ならば [Cent OS](http://www.centos.org/) がいいでしょう。

2013年6月現在、Debianの最新バージョンは **7.0 "Wheezly"** です。

まず [ダウンロードページ](http://www.debian.org/distrib/netinst) から
自分が使っているマシンに合ったisoイメージを選択してダウンロードします。
乱暴な区分ですが使っているマシンが32bit CPUならば *i386* を、 64bit CPU なら *amd64* を選択すればだいたい問題ないです。

isoイメージのダウンロードが終わったら先ほどの仮想マシンを起動します。
仮想マシンを選択して *起動* ボタンを押してください。

![仮想マシンを起動する](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/added.png)

…まだ何もOSがインストールされていないので何も動きません。インストールを始める準備をします。

![起動失敗](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/create-vm.boot-failue.png)

画面右下の *CDアイコンをクリック* して、 *先ほどダウンロードしたisoイメージを選択* します。
正しくisoイメージが選択されたら *CDアイコンの表示が変わる* のでわかると思います。

isoイメージを選択したら *メニュー* から *マシンの再起動* （あるいはリセット） を選択して再起動します。
無事にインストーラが起動すれば大丈夫です。もし起動しなかった場合はisoイメージがちゃんと破損していないか確認してください。

インストーラの種類を選ぶことができます。今回は **Graphical install** を選択します。

![インストーラを選択](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/create-vm.installer.png)

インストーラで使用する言語を選択します。日本語を選びましょう。

![言語の選択](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/install-debian.choose-language.png)

画面の指示にしたがって進みます。ネットワークとユーザーは以下の内容で設定しました。

項目 | 値
----|---
ホスト名 | debian 
ドメイン名 | (空白) 
rootのパスワード | d3b14n 
ユーザーのフルネーム | jiska 
ユーザーのアカウント名 | jiska 
ユーザーのパスワード | jisk4 

***

ディスクのパーティション設定もデフォルト値で指定しましょう。

*はい* を選択しないと次に進みません。

![パーティションの選択](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/install-debian.make-partition.png)

次に *パッケージマネージャ* の設定です。これもデフォルト値の `ftp.jp.debian.org` を選択します。

![パッケージマネージャ選択](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/install-debian.package-manager.1.png)

![パッケージマネージャ選択](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/install-debian.package-manager.2.png)

どのパッケージがよく利用されているかの統計をとる *popularity-contest* の設定です。
個人の好みですがせっかくなので *はい* を選択しておきます。

![popularity-contest](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/install-debian.join-popularity-contest.png)

最後に初期インストールするソフトウェアの選択です。

**Debian デスクトップ環境** 、 **SSHサーバ** 、 **標準システムユーティリティ** にチェックが入っていることを確認してください。
他項目は必要に応じてチェックを入れますが後からインストールすることができますので空白のままでも大丈夫です。

![ソフトウェアの選択](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/install-debian.choose-software.png)

後は見守るだけです。１時間くらいはかかりますので休憩でもとりましょう。

![インストール中](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/install-debian.wait-install-process.png)

途中で入力を求められることもあるかもしれませんがデフォルト値を選択すれば大丈夫でしょう。
完了すると自動でマシンが再起動します。

![インストール完了](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/install-debian.finish.png)

### Debianの起動

Debianのログイン画面が表示されます。さきほどのユーザー名とパスワードを指定しましょう。

VirtualBoxの初期設定ではこのまま起動するとログイン後にエラーが発生します。
とりあえずエラーを回避するため左下の *デスクトップマネージャ* から **GNOME Classic** を選択します。

![ログイン](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/boot-debian.login.png)

ログインができました。

![ログイン完了](/images/posts/2013-06-08-start-desktop-linux-on-virtualbox/boot-debian.success.png)

これでデスクトップLinux環境が完成です。今回はDebianが起動したところで終わりにします。これからいろいろカスタマイズしていきましょう。

## 最後に

仮想環境は簡単に作成することができます。もし失敗をしても仮想環境を削除して再度作成することも簡単です。

いちどお試しあれ。