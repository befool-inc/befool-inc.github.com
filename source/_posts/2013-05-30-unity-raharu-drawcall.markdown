---
layout: post
title: "【Unity 入門】DrawCallが多かった原因"
date: 2013-05-31 21:36
comments: true
categories: unity 勉強 入門
author: raharu
---

初めまして、技術部raharuです。  
今回は前にUnityを勉強していた際に気づいた事を一つ。  

とりあえず動くものを作る事を目標に今までつくってみましたが  
他の方の記事をみていたらDrawCallなる物がFPSおよび負荷に多大な影響を与えているとのこと。  
自分のつくった物を見てみたらなんと最大値160！これはちょっと多すぎる。  

![New Project](/images/posts/2013-05-30-unity-raharu-drawcall/1.png)

基準としてはスマホも対応させるなら40が程度に押さえるのが良いそうです。  
で、なにかこんなにDrawCallを増やしているのかしらべてみました。  
色々調べた結果遂に原因がわかりました。原因は__ライト__です。  

![New Project](/images/posts/2013-05-30-unity-raharu-drawcall/2.png)

今回プレイヤーの周りだけを明るくする為に追尾カメラにPointLightを入れていたのですが、  
このライトが壁のプレハブを照らすのが良くない様です。  
ライトが照らす壁やオブジェクトが多いとDrawCallが多くなってしまうのでしょうか。  
これは予想ですが、照らされている場所と暗い場所は別にCallしてるのかもしれません（どなたかわかる方教えてください。）  
兎にも角にもこのライトが原因だったのでこのpointLightをやめて全体を照らすDirectional Lightにしてみました。  

![New Project](/images/posts/2013-05-30-unity-raharu-drawcall/3.png)

__その結果最大値９！__  

![New Project](/images/posts/2013-05-30-unity-raharu-drawcall/4.png)

そんなに違うんですか！そうですか！  
もしかしたらUnityユーザーの方達の間では当たり前の事なのかもしれませんが、  
劇的に値が違ったので備忘録として残しておきます。  
DrawCallライトには気をつけろ。  
肝に命じておく事にします。  

本家は[とあるプログラマの備忘録](http://d.hatena.ne.jp/raharu0425/20130131#1359645274)こっち

