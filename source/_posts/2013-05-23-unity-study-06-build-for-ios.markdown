---
layout: post
title: "Unity勉強 第6回 「ついに！無償化された、build for iOS を試してみる」"
date: 2013-05-23 21:36
comments: true
categories: unity 勉強
author: 8823-scholar
---

## モバイル向け機能の完全無償化

おはようございます。AKB48の中では、横山由依ちゃんが大好きな智史之介です。

[Unity, iOS と Android を含む個人・小規模開発者向けのモバイル向け機能を完全無償化](http://japan.unity3d.com/blog/press/2013/05/21/unity-ios-%E3%81%A8-android-%E3%82%92%E5%90%AB%E3%82%80%E5%80%8B%E4%BA%BA%E3%83%BB%E5%B0%8F%E8%A6%8F%E6%A8%A1%E9%96%8B%E7%99%BA%E8%80%85%E5%90%91%E3%81%91%E3%81%AE-%E3%83%A2%E3%83%90%E3%82%A4/)

やってくれました…！我々にできないような事を平然とやってのけるUnity…そこにしびれるぅあこがれるゥゥッ！

確かに、「file > build settings」のメニュー内で、ios向けを選択できるようになっているようです（できない人はアップデートしてみてね）。
これは試してみるしかないでしょう、というわけで、本日の課題は、この「モバイル向けの機能」というものを試してみようと思います。

ズバリ！「iOS向けにビルド」しちゃいます。ウヒヒ。


## 前回のプロジェクトをコピー

なんか適当なプロジェクトを作成するのも面倒ですので、
[Unity勉強 第5回 「アニメーションgifって使えるの？」](/blog/2013/05/22/unity-study-05-enable-animated-gif/)
で作成したプロジェクトをコピーして「06.Build4iOS」とでも名前変更し開きます。

え、そんなんでいいのかって？  
いいんです！これでいいんです！（川平風）
今日も張り切って行きましょう。


## Build Settings

### cross platform settings

iOS向けにビルドするために、まずは「File > Build Settings」のメニューを選択し、ビルド設定画面を開いてください。  
開くと、ビルド可能なプラットフォームの一覧が並んでいると思いますので、ノーシンクで「iOS」を選択しましょう。

すると「inspecotr」内に設定項目がでてきます。

![てきとーに入力](/images/posts/2013-05-23-unity-study-06-build-for-ios/settings.cross-platform.jpg)

このあたりはテキトーに入力していいものだろうか？と悩みつつテキトーに入力しちゃいます。

### per platform settings

![よくわからないまま入力](/images/posts/2013-05-23-unity-study-06-build-for-ios/settings.per-platform.png)

こちらもよくわからないのですが、いじった方が良さそうな項目はこちらかな？

設定キー                    | 値                           | メモ 
:---------------------------|:-----------------------------|:----------------------------------------------
Bundle identifier           | jp.co.befool.study.build4ios | 事前にApp IDsをApp Dev Centerで作成の必要あり


## いざ、ビルド！

各種設定項目を適当に入力したら、ついにビルドです。

![ビルド](/images/posts/2013-05-23-unity-study-06-build-for-ios/build.png)

「add current」でビルド対象のシーンを追加したうえで、「build」実行するだーーーーーッ！

ビルドが完了したらfinderで出力先のフォルダが開くので、「Unity-iPhone.xcodeproj」を選択してXcodeを開きましょう。


## Xcode…それは未知の世界

ここから先は、本当に正直よくわからないです…。とにかくいろんなサイトを参考にしながら手探りで進めました。

ちょっとApple周りの各種手続きに関する説明まで本記事に含めると、とんでもない大作になってしまいそうなので今回は割愛させてください。
気が向いたら、別記事で起こします。

本記事では、簡単ですがやったことリストだけ並べさせていただきます。

* Apple Dev Centerへの登録
* 開発に関する権利を購入
* 証明書の作成
* identifierの作成
* 開発機の登録
* Provisioning Profileの作成
* 証明書、Provisioning Profileのmac機への設定

などをおこないました。
このあたりの手続きに関しては詳細に説明したWEBページが色々ありますので、是非それらを参考に進めてみてください。

### code signing

![code signing](/images/posts/2013-05-23-unity-study-06-build-for-ios/xcode.settings.code-signing.png)

なんだかよくわからないけど、設定しろ書いてあった。

![デバイス選択](/images/posts/2013-05-23-unity-study-06-build-for-ios/xcode.choice.device.jpg)

さあ、「Run」を押しましょうぞ！！

![入った！](/images/posts/2013-05-23-unity-study-06-build-for-ios/build.to.iphone.png)


入った！！！

入ったが…！

いたーーーーい！！！なんだかよく分からないけど僕の心がいたーーーーーいッ！  
iPhoneの待ち受け画面を全世界に公開してしまい、これでまたモテ道から遠のいてしまうんですね…。
どうか皆さんどん引きしないでください…orz


![うごいた！](/images/posts/2013-05-23-unity-study-06-build-for-ios/run.on.iphone.png)

起動！！

おおおおおおおおお！いい感じに動いています！！

というわけで、今日はここまで〜！


## 次回に向けて

今日は無償化されたiOS向けのビルドを試してみました。  
Unity側の設定は驚くほど簡単で、困ることはないでしょう。  

ただただXcode周りの設定が難しかった…。
Dev centerとか、証明書とか、Provisioning Profileとか…もう未知の言葉のオンパレードでしたね…orz

ただ、おかげでなんとか各種役割のようなものは理解できたつもりでいます。

次回は、この流れで、「Android向けのビルドを試してみる」行ってみたいと思います！
どうぞよろしくお願いいたします。


