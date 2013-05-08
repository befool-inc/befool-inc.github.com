---
layout: post
title: "Unity勉強 第1回 「Hello World」"
date: 2013-04-30 13:21
comments: true
categories: unity, 勉強会
author: 8823-scholar
---

## Unityとは？

iPhoneアプリの開発とか、Androidアプリの開発だとかで、
やれObjective-Cだとか、やれJAVAだとか、そういった言語の習得が必須なわけですね。  
エンジニアとしては、できればそれぞれそのネイティブな言語でアプリを開発したい気持ちが強いのですが、そうも言ってられない事情もありまして…。  

開発環境の構築、言語の習得、ノウハウの蓄積など、様々なコストがあり、
「iPhoneでもAndroidでもアプリを出すんだい！」というプロジェクトの場合、
それらのコストが「2倍になります」という状況は、非常にツライものがあります。  
特別めんどくさがり屋さんでなくとも、一つ作れば、それがiPhoneでも動くし、Androidでも動く、というのが理想なわけです。  

それを実現してくれるのが「Unity」なのです。


## プロジェクトを作成する

さあさあとりあえずいじってみよう、というわけで、みんな大好き「Hello World」行ってみようと思います。

File > New Project  
を選択して、プロジェクトの作成。  
**Import the following the packages** は今のところよく分からないので空で。

![New Project](/images/posts/2013-04-30-unity-study-01-hello-world/NewProject.png)


## 「Hello World」を表示する

ググってみると、みなさん、**debug.log('hello world.')**のように、コンソール上に出力しているようですが、
やはりユーザー目線で何かしらの表示させたいのが正直なところでしょう。  

何かないかなーとメニューを漁っていると、「**3D Text**」なるものを発見！これか？！  

GameObject > CreateOther > 3D Text

選択してみると…、おっ。なんか画面上に配置された。しかも、既に「Hello World」ってなってる！

![New Project](/images/posts/2013-04-30-unity-study-01-hello-world/CreateObject.png)

憎い…この気の利かせ方が憎いでござる…！

なんかこれで「できました」っていうのも癪なので、めくらめっぽにあっちいじったり、こっちいじったりしながら作成したのがこちらのHelloWorldです。

![New Project](/images/posts/2013-04-30-unity-study-01-hello-world/HelloWorld.png)

よし。「枠に収まらない漢」というアピールができました！


## 次回の予定

次回は画像の表示を行いたいと思います。

