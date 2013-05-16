---
layout: post
title: "Unity勉強 第2回 「画像を使ってみる」"
date: 2013-05-01 23:55
comments: true
categories: unity 勉強会
author: 8823-scholar
---

## なにはともあれプロジェクトの作成

File > New Project  
を選択して、プロジェクトの作成。  
常に、まずはここからです。  
**Import the following the packages** に関しては今のところ空のままでいいでしょう。

![New Project](/images/posts/2013-05-01-unity-study-02-use-image/NewProject.png)


## 漢は黙ってドラッグ＆ドロップ

まだ第二回ということで、右も左も分からない赤子同然。
画像の挿入に関しても「ドラッグ＆ドロップでいけるでしょ？」と完全に相手ををなめきっている模様。

「**おれのミンカフォルダが火を噴くぜ！**」

と言わんばかりに光の速度でFinderを開き、お気に入りの画像をドラッグ＆ドロップ！

![Drag & Drop](/images/posts/2013-05-01-unity-study-02-use-image/DragAndDropToStage.png)

(´・ω・｀)  
「Scene」へ直接はダメだったけど、なんか「Assets」には入った。  

分かった。AssetsからはSceneに投げ込めるんだな！天才か。自分は。自分で自分が怖くなるぜ…。誰か俺を止めてくれ。  
など、ブツブツ意味不明な供述をしながらAssetsからドラッグして、Sceneへドロップ！

だめでした(´・ω・｀)

もしかしたらUnityにはドラッグ＆ドロップという概念がないのかもしれないですね！（そんなばかな）


## GUI Textureなにするものぞ

Google先生に聞いてみると、「GUI Texture」なるものがあるらしい。  
見るからに2D画像を扱いそうな名前をしている！これに違いない。

GameObject > Create Other > GUI Texture

を選択してオブジェクトを追加。  
すると、「UnityWatermark-small」なるものがHierarchyに追加された。クリックすると、ステージ上でカメラとは別のオブジェクトが選択されたように見える。
これは、もしかして…？と思い「Game」タブをクリックしてみると…。

![Unity画像](/images/posts/2013-05-01-unity-study-02-use-image/AddImageUnity.png)

表示されてる！だけど漂う「キミジャナイ」感。  
そう、私はミンカの画像を表示させたいのである。  
Inspector上で、画像の参照を、先ほどAssetsに追加されたミンカ画像を選択、っと。  
同じくInspector上で、サイズ、配置などをチョコチョコッと修正、っと。

![ミンカ画像](/images/posts/2013-05-01-unity-study-02-use-image/AddImageMinka.png)

できた！というわけで今日はここまで。  
次回は、サウンドの挿入をやってみたいと思います。  


## ミンカが結婚を前提にお付き合いしてくれないかな

ミンカさん、僕と結婚してください！|ω・`）ﾁﾗｯ


