---
layout: post
title: "Unity勉強 第9回 「永続データストレージを試してみる（ローカル編）」"
date: 2013-09-08 16:56
comments: true
categories: unity study
author: 8823-scholar
---

## 前回のおさらい＆今回の目標

最近FXを始めました。智史之介です。  
前回から結構時間が開いてしまいましたね…。反省です。できれば週一と言わないまでも、隔週くらいでは勉強する時間を確保していきたいものです。

さて、前回のUnityの勉強ですが「[シーンの切り替え](/blog/2013/06/15/unity-study-08-scene-change/)」というような内容でした。
その関係で「シーンを跨いだ変数の保持」というような内容を試してみたくはあるのですが、ちょっと後回しにして…、今日は「永続データストレージ」に挑戦です。


### 永続データストレージとは？

ここで言うところの「永続データストレージ」とは、つまり、「 **ゲームを落としても次回起動後に保存したデータを参照可能な領域** 」というような意味合いです。
（なにっ、わかりづらいですと！すみません。）


## まずは箱形を用意

![箱形](/images/posts/2013-09-08-unity-study-09-save-variables-to-local-strage/create_project.png)

本当に簡単な内容になりますが、GUI Textオブジェクトをさくっと画面上に配置してみました。
ここに、ゲームを起ち上げてからの秒数を記録してみることにします。

```javascript
#pragma strict

var timer : int = 0;
 
function Start () {
    guiText.text = timer.ToString();
}

function Update () {
    var time : int = timer + Time.time;
    guiText.text = time.ToString();
}
``` <!-- ` -->

スクリプトとしてはこんな感じ。これをGUI Textにドラッグ＆ドロップでアタッチすることで、ゲームを起ち上げてからの秒数が画面上に表示されます。

ただし！これはゲームを一度落とすと再度「0」から始まってしまいます。
これを、前回の秒数を記録しておき、次回起ち上げ時には前回落とす前の数字から始まるように調整してみることにします。


## ローカルストレージにデータを保存する

PlayerPrefsなるものを使用するようです。

* [強火で進め: ゲームのスコア情報などを簡単に保存出来るPlayerPrefsクラス](http://d.hatena.ne.jp/nakamura001/20110712/1310441315)
* [Unity Script Reference: PlayerPrefs](http://docs.unity3d.com/Documentation/ScriptReference/PlayerPrefs.html)

上記のサイトを参考にしつつ、スクリプトをこんな感じに改修。

```javascript
function Update() {
    var time : int = timer + Time.time;
        
    // Save to PlayerPrefs
    PlayerPrefs.SetInt('timer', time); 

    guiText.text = time.ToString();
}
``` <!-- ` -->

どうやら、``PlayerPrefs.SetString``とか``PlayerPrefs.SetFloat``とか、型を指定して保存するらしい。  
これはめんどくさいかもしれぬ…。


## ローカルストレージからデータを読み込んでみる

上の修正だけではただデータを保存しているだけなので、起動時にPlayerPrefsから秒数を読み込む改修も加えてみることにします。

```javascript
function Start () {
    // Has in PlayerPrefs ?
    if (PlayerPrefs.HasKey('timer')) {
        timer = PlayerPrefs.GetInt('timer');
    }

    guiText.text = timer.ToString();
}
``` <!-- ` -->

これで、ゲームを落としても次回起動時は秒数が途中からカウントされるようになりました！ｳﾎﾎｰｲ。

![カウントアップ成功](/images/posts/2013-09-08-unity-study-09-save-variables-to-local-strage/countup_timer.png)


## PlayerPrefsの注意点

PlayerPrefsは、そのデータをローカルの端末自身に保存されます（Windowsに至ってはどうもレジストリに書き込まれる模様？！）。
データ改ざんが容易である可能性が高いので、重要なデータなどはやはりネットワークを通じた外部に保存するのがよいのではないかなと思われます。。

ただ、プレイヤーの設定情報など、簡単なデータに関しては十分活用の余地はあると思いますので、適材適所で使って行けたらと思います。


## 次回に向けて

次回は、ついにというかなんというか、今まで見て見ぬ振りをしてきた「Prefab」なるものに手を出してみようかなと…。

Unityの事を調べる度にその名前が登場するほど、Unityでは当たり前の存在らしい、「Prefab」とは一体なにものなのか？！  
まずはそこから調べてみようかと思います。

ではでは！

