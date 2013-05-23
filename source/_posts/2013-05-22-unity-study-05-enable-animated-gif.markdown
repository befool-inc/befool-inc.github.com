---
layout: post
title: "Unity勉強 第5回 「アニメーションgifって使えるの？」"
date: 2013-05-22 21:05
comments: true
categories: unity 勉強
author: 8823-scholar
---

## 前回までのおさらい＆今回の目標

前回は、「ボタンを押したらサウンドを鳴らす」というテーマに挑み、情報の少なさに辟易しながらも、匍匐前進でなんとか目標を達成しました。
本日は、「アニメーションgifって使えるの？」をテーマに進行したいと思います。


## 画像の選出

まずは組み込むためのアニメーションgif探しからです。  
オシャレ男子であれば、ここで颯爽と「ゴッホ」だとか「ゴーギャン」だとか拾ってくるところですが、僕のようなオタク男子ではやはりこういう結果にあいなります。

![ミクさん](/images/posts/2013-05-22-unity-study-05-enable-animated-gif/miku.gif)

ブヒヒヒィィィィィ！  
ミクさんかわいいよ、ぺろぺろ。

落としてきたgifファイルはassetsに投げ込んでおきます。


## 初音ミクは動かない

さて、assetsに追加したミクさんgifを、ステージに配置したいので、

GameObject > Create Other > GUI Texture

を選択。なんかデフォルトでミクさんgifが選択されていましたが、もし選択されない場合はinspectorのtextureメニューでミクさんgifを選択してあげてください。

Unity先生であれば、もうこれでミクさんを動かしてくれてるんでしょ？もうかっこよすぎ☆なんて思ってプレビューしてみると…、

![初音ミクは動かない](/images/posts/2013-05-22-unity-study-05-enable-animated-gif/preiew.first.png)

動かない、だと…。  
ミクさんは止まったままです。一向に動いてくれる気配がありません。

「やれやれだぜ…」

Unity先生も万能じゃないのね、と失望半分、かわいさ半分の気持ちを織り交ぜつつ、今回も大変な回になりそうだぜ、という予感がざわざわと立ち上ぼり始めました。


## どうしてアニメーションgifは使えないのか？

[animated gif is not working](http://forum.unity3d.com/threads/27873-animated-gif-is-not-working)

この質問に回答しているEric5h5さんが言うには、

> Unity doesn't have any support for animated gifs. It's a terrible format anyway; use a series of textures instead.  
> (智史之介訳：Unityはアニメーションgifをサポートしていないよ！あれはひどい形式をしてやがるんだよ…。代わりにtextureを使ってくれよな！)

まじかー。そんなこと言わずにサポートしてくださいおねがいします(ｽﾞｻﾞｰ

しかたがないので、textureでやってみようと思います。


## アニメーションgifを分割してみる

アニメーションgifを分解するのに「ImageMagick」を用いました。

```bash
$ convert +adjoin -coalesce miku.gif miku-notanimated.gif
$ ls -1
miku-notanimated-0.gif
miku-notanimated-1.gif
miku-notanimated-2.gif
miku-notanimated-3.gif
miku-notanimated-4.gif
miku-notanimated-5.gif
miku-notanimated-6.gif
miku-notanimated-7.gif
miku-notanimated-8.gif
miku-notanimated-9.gif
```

うん、おｋっぽいですね。  


## 箱形の作成

これらの画像を表示するための箱形を用意しましょう。
僕は「GUITexture」を選びました。

GameObject > Create Other > GUI Texture

で、シーンに配置します。
デフォルトのtextureには、「miku-notanimated-0.gif」を選択し、pixel insetに関しても調整しておきます。

![GUI Texture追加](/images/posts/2013-05-22-unity-study-05-enable-animated-gif/inspector.add.guitexture.png)


## ミクさん画像を切り替えるためのスクリプトを追加

Assets > Create > Javascript

で、スクリプトを作成します。名前は「miku」とでもしておきます。
そしてそれを先ほど作成した「GUI Texture」にドラッグ＆ドロップでアタッチ！

inspector上で、「miku(script)」が追加されていればおｋです。

![script追加](/images/posts/2013-05-22-unity-study-05-enable-animated-gif/inspector.add.script.png)

さあ、ここらが本番です。  
今追加したスクリプトでやりたいことは、「textureを一定時間毎に切り替えていく」という処理です。

スクリプトはこんな感じになると思います。

[Animated Gif(Unity Answers)](http://answers.unity3d.com/questions/13156/animated-gif-as-a-texture-on-iphone.html)
を参考にしました。  
はい、コピペって言わない！

```javascript
#pragma strict

var frames : Texture2D[];
var framesPerSecond = 10.0;

function Start () {

}

function Update () {
    var index : int = Time.time * framesPerSecond;
    index = index % frames.Length;
    guiTexture.texture = frames[index];
}
```

ただ、ここで即プレビューしてもうまく動きません。当たり前の話ですが「frames」として定義された配列に、何もデータが入っていないためです。
この配列にデータをぶち込むにはどうしたらよいのでしょうか？  
答えは「inspector上で追加する」でした。

![size0](/images/posts/2013-05-22-unity-study-05-enable-animated-gif/inspector.frames.size0.png)

この「size」プロパティに「10」をぶち込んでください。すると…

![size10](/images/posts/2013-05-22-unity-study-05-enable-animated-gif/inspector.frames.size10.png)

おおおお！textureを指定できる覧が出てきたぞ！これはかなりの感動ものです。  
プログラマ的には、ソース上で定義したデータ箱にGUI上からサイズの指定を行う、というフローになかなか感覚がついていかないので、
時間があるときにでもソース上からsizeを指定する方法を探してみます。ひとまず今日はこのまま進むぜ！

あとは、簡単です。出てきたtextureの指定欄の一つ一つに、分解されたgifを当て込んでいきます。  
それでプレビューすると…

![アニメーションしてる](/images/posts/2013-05-22-unity-study-05-enable-animated-gif/preview.animated.png)

動いてるーーーーー！（画像じゃ分からないけど）

まあいいだろう。ミッションコンプリートだ！


## 次回に向けて

Unityがとんでもない発表をしてくれました。Unityのモバイル向け機能を完全無償化するというのです。
早速試そう！ということで、次回は「iPhone用にビルド」、いってみたいと思います！

