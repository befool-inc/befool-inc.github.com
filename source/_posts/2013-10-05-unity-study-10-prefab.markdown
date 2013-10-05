---
layout: post
title: "Unity勉強 第10回 「Prefabを試してみる」"
date: 2013-10-05 16:41
comments: true
categories:  unity study
author: 8823-scholar
---

## 前回のおさらい＆今回の目標

最近夜になるとめまいで立ってられない智史之介です。おはようございます。  
いい加減まずいな、と思い病院に行ったのですが、3分ほどの診療でMRIも撮らせてくれず、早々にあしらわれてしまいました…。  
ファ○ク!!  
他の病院探そう…。

今日の課題は「prefab」です。  
Unityを触るにあたって避けては通れない要素のようですので、このあたりでまずは第一回挑戦をしておくべきかなと。  
「Prefabとは？」というそんな段階から迫ってみたいと思います。


## Prefabとは？

[Unity - プレハブ](http://ws.cis.sojo-u.ac.jp/~izumi/Unity_Documentation_jp/Documentation/Manual/Prefabs.html)

> プレハブはAseetの種類の１つです。 再利用可能なゲームオブジェクトでプロジェクトビューに保存されます。プレハブは複数のシーンにも、また、１つのシーンに複数追加する事も出来ます。 プレハブをシーンに追加する時はインスタンス(instance)が生成されます。プレハブのインスタンスは、全てオリジナルのプレハブにリンクしているため、意味的にはクローンとなります。プロジェクトに存在するインスタンスの数に限らず、プレハブに変更を加えると、インスタンスにも反映されます。  

うーん。これだけでは正直よく分からないっす。Flashで例えると、ムービークリップとそのインスタンスのようなものなのかな…？


## 漢なら、やってやれ、だ！

とりあえず、直感的に感じた方法で試してみる事にします。

### prefabの作成

prefabの作成に関しては、

+ 最初にprefabを作成して、その中にobjectを配置する方法
+ 既存のobjectをprefab化する方法

があるらしいです。
今回は後者の方法で試してみます。

#### 適当なobjectを配置する

![cubeの作成](/images/posts/2013-10-05-unity-study-10-prefab/create-cube.png)

えいっ。

#### ドラッグ&ドロップでprefab化

HierarchyタブからProjectタブにDrag&amp;Dropで移動することでPrefab化できるようです。

![prefabの作成](/images/posts/2013-10-05-unity-study-10-prefab/create-prefab.png)

#### prefabをステージ上に配置する

![prefabの配置](/images/posts/2013-10-05-unity-study-10-prefab/prefab-put-on-stage.png)

Projectタブ内のprefabをDrag&amp;Dropでステージに配置します。  
これは「prefabのインスタンス化」と呼びます。（たぶん）

それにしてもUnityのこのカメラ周りの操作に未だになれません…。
自分が持って行きたいアングルになかなか調整できないのです…orz


## インスタンス同士はリンクしている？

> プレハブのインスタンスは、全てオリジナルのプレハブにリンクしている

という事なので、元のPrefabをいじった場合、全てのインスタンスにその影響があるはずです。
青色を適用するMaterialを作成し、それを先ほどPrefab化したCubeにDrag&amp;Dropします。

![prefabに色を適用する](/images/posts/2013-10-05-unity-study-10-prefab/attach-material-to-prefab.png)

おお！一斉に変わった！

ここまでであれば、一番最初に受けた印象である「Flashで例えると、ムービークリップとそのインスタンスのようなもの」という認識が正しいように思えますね…！


## せっかくなので

色々試して見ようということで、cube prefabに「Rigidbody」というコンポーネントを当ててみました。  
それがこれである。

[Unity WEBプレイヤー - Prefabテスト](/resources/posts/2013-10-05-unity-study-10-prefab/build.web/build.web.html)

やはり全ての新スタンスに同じ物理法則が割り当てられたようだ。イイデスネ！


## その他の用途

[Resources.Loadでシーンをまたぐ変数 - Unity勉強記](http://unity-study.net/archives/366)

こちらのサイトで紹介されている手法は、どうもprefab本来の使い方とは違うように見える（もしかしたら変数名として使用しているだけかもしれない）。
ただ、僕自身まだUnity初心者の域を出ないため、なんとも言えないところですが。。  
もうちょっと経験を積んだら見えてくるものがあるかしら！


## 次回に向けて

今回は「prefab」に関してさくっとだけ触ってみました。Flashに慣れ親しんでいたせいもあるかもしれませんが、Flashの要素に置き換えて理解できると非常に個人的に分かりが良くて楽ですね。
ただし…！次回は「3Dモデルを操作する」事に挑戦してみようかなと思っています…！

Flashはご存じの通り2D指向のオーサリングツールです。（3D的なものを扱う事も可能ですが、やはり主戦場は2Dです）
Flashに置き換えて理解するのが難しい領域である3Dは、個人的にハードルの高い分野です。

頑張ります。では！



