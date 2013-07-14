---
layout: post
title: Vagrantで開発環境構築を自動化する
date: 2013-07-14 15:53
comments: true
categories: Vagrant
author: jiska
---

![Vagrant logo](/images/posts/2013-07-14-use-vagrant/vagrant-logo.png)

森です。先日開催された [Vagrant meetup](http://chef-meetup.doorkeeper.jp/events/4624) に参加しまして
開発者のHashimotoさんからVagrantのお話を聞くことができすごくホクホクしております。

熱が抜けないうちにVagrantを用いての開発環境作成のおさらいをこの場にまとめます

## Vagrant とは

そもそもVagrantとは何か、乱暴にいうと **開発環境を簡単に作成する** ためのツールです。
Virtual Boxなどの仮想化ソフトウェアなどを用いて各人のマシンに本番環境にほぼ等しい環境を誤りなくセットアップしてくれます。

開発者の Hashimoto さんの [The Tao of Vagrant](http://mitchellh.com/the-tao-of-vagrant) から引用すると

>In a world with Vagrant, developers can check out any repository from version control, run vagrant up, and have a fully running development environment without any human interaction.
>Developers continue to work on their own machine, in the comfort of their own editors, browsers, and other tools.

Vagrantを使用することで *完全に動作する開発環境を人間の作業なしで作成でき、開発者は自分のマシンで好みのエディタ、ブラウザ、デバッグツールなどを使うことができます。* 

さっそくVagrantをインストールして仮想環境を起動してみましょう。

余談ですが手動でVirtual Boxを起動してVMを設定して必要ソフトウェアをセットアップして…という作業は最初の一回だけやるぶんにはいいのですが
*他メンバーに同じ環境を用意する* 場合に大変です。
自分が使っているVMをコピーして渡してもいいのですが
セットアップ後にインストールした不要ツールを取り除いたり逆に後から追加したライブラリ設定を戻したり…
こんなことをしているうちに元のVMが何が何だかわからなくなってしまった…という経験はありませんでしょうか？自分はかなり多いです。

## お断り

先に断っておきますと、この記事に書いてある内容は [Vagrant 公式サイト](http://www.vagrantup.com/) の [GETTING STARTED](http://docs.vagrantup.com/v2/getting-started/index.html) を自分なりに噛み砕いたものです。
より正確にVagrantについての理解を深めたい場合は公式サイトを一読することがオススメです。

<!-- more -->

まず *Virtual Box* のインストールが必要です。僕の [前回の記事](/blog/2013/06/08/start-desktop-linux-on-virtualbox/) あたりを参考にしつつインストールをしてください。

## Vagrantのインストール

まずは [公式サイト](http://www.vagrantup.com/) へアクセスしましょう。

[ダウンロードページ](http://downloads.vagrantup.com/) へアクセスし、最新バージョンのVagrantを選択して自分の使用しているOSにあわせたインストーラをダウンロードします。
以降Macを利用しているていで進めますがUbuntuなどのLinuxでも同じ手順で進められると思います。Windowsはよくわかりませんので後で環境探して試してみます…。
2013年7月14日現在の最新バージョンは **1.2.3** です。

![Download](/images/posts/2013-07-14-use-vagrant/download-vagrant.png)

ダウンロードしたインストーラを起動してVagrantをインストールしたらターミナルを開いてvagrantコマンドの確認をしましょう。

```bash
$ vagrant -v
Vagrant version 1.2.3
```

バージョン情報が表示されればインストール成功です。

## プロジェクトの設定

Vagrantを使う上で必須なのがプロジェクトの設定ファイルである **Vagrantfile** を作成することです。
共通のVagrantfileを利用することで前述の完全に動作する開発環境を人間の作業なしで作成することができるのです。

今回はサンプルとして新規にVagrantfileを作成しましょう。適当なディレクトリを作成し、そこで `vagrant init` をすることでVagrantfileを作成します。

```bash
$ mkdir vagrant_getting_started
$ cd vagrant_getting_started
$ vagrant init
A `Vagrantfile` has been placed in this directory. You are now
ready to `vagrant up` your first virtual environment! Please read
the comments in the Vagrantfile as well as documentation on
`vagrantup.com` for more information on using Vagrant.
$ ls -l
total 16
-rw-r--r--  1 jiska  staff   4.4K Jul 14 17:07 Vagrantfile
```

できました。

Vagrantfileは *ruby* で記述することができます。
初期生成されたVagrantfileには細かいサンプルが記述されているのでそれを参考にして自分用のプロジェクトの設定を行いましょう。

## boxのダウンロード

boxとはVagrantで使用する仮想マシーンの基本イメージです。ひな形とかテンプレートとかいうほうがイメージしやすいと思います。
boxにはCentOS, Debian, Ubuntu, Windows Serverなど様々なOSが利用できます。

本来ならば各人のシステムに合わせてboxを生成するのですが、今回は公式に提供されているboxから *precise64 (Ubuntu12.04 64bit)* を追加します。

```bash
$ vagrant box add precise64 http://files.vagrantup.com/precise64.box
(ダウンロードに時間がかかるのでちょっと待つ）
$ vagrant box list
precise64 (virtualbox)
```

boxの追加には `vagrant box add {name} {url}` , 一覧の確認には `vagrant box list` コマンドを利用します。これでboxにprecise64という名前でUbuntu12.04サーバーエディションが登録されました。

先ほどのVagrantfileを編集してboxの設定を変更します。

```ruby
Vagrant.configure("2") do |config|
  config.vm.box = "precise64" # box名をここで指定する
end
```

## 仮想マシンを起動する

起動には `vagrant up` コマンドを使用します。

```bash
$ vagrant up
Bringing machine 'default' up with 'virtualbox' provider...
[default] Importing base box 'precise64'...
[default] Matching MAC address for NAT networking...
[default] Setting the name of the VM...
[default] Clearing any previously set forwarded ports...
[default] Creating shared folders metadata...
[default] Clearing any previously set network interfaces...
[default] Preparing network interfaces based on configuration...
[default] Forwarding ports...
[default] -- 22 => 2222 (adapter 1)
[default] Booting VM...
[default] Waiting for VM to boot. This can take a few minutes.
[default] VM booted and ready for use!
[default] Mounting shared folders...
[default] -- /vagrant
```

VMが起動しました。

```bash
$ ps aux | grep vagrant
jiska          30771   0.5  5.3  2724752 223116   ??  S     5:37PM   0:12.09 /Applications/VirtualBox.app/Contents/MacOS/VBoxHeadless --comment vagrant_getting_started_1373791025 --startvm 489b9052-9bfd-4063-b1cc-a6572b8a3a94 --vrde config
```

起動したVMにsshで接続するためには `vagrant ssh` コマンドを使用します。

```bash
$ vagrant ssh
Welcome to Ubuntu 12.04 LTS (GNU/Linux 3.2.0-23-generic x86_64)

 * Documentation:  https://help.ubuntu.com/
Welcome to your Vagrant-built virtual machine.
Last login: Sun Jul 14 08:42:40 2013 from 10.0.2.2
vagrant@precise64:~$ exit
logout
Connection to 127.0.0.1 closed.
$ 
```

VMの停止は `vagrant halt` コマンドです。 

```bash
$ vagrant halt
```

後は **box起動時に必要な環境をセットアップするための設定をVagrantfile** に記述することで各プロジェクトに沿った開発環境を作成することができます。Vagrantfileについては長くなってきたので次回です。

Vagrantを用いることでVMの初期設定、起動、停止が簡単にできました。Vagrantfileに設定でホストOS,ゲストOSとの共有フォルダ設定やネットワーク設定なども定義できます。
また、Vagrantfileをバージョン管理することで変更を追うことも容易になります。

現在のバージョンのVagrantはVirtualBoxだけでなく *VMware* や *Amazon EC2* もサポートしています。ネットワークさえ繋がれば仮想マシンを簡単に作成することが出来るのです。すごい！

## 結論

**Vagrant使おう!** ということです。