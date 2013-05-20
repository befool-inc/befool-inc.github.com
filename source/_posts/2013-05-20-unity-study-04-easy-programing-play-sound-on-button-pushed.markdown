---
layout: post
title: "Unity勉強 第4回 「簡単なプログラムをやってみる：ボタンを押したら音楽を再生」"
date: 2013-05-20 20:58
comments: true
categories: unity 勉強
author: 8823-scholar
---

## 前回までのおさらい＆今日の目標

どうもみなさん。おはようございます。初音ミクとミンカが三度の飯より大好きな智史之介です。
今日も今日とてUnityの勉強をおこないたいと思います。  
前回は「サウンドを鳴らす」というテーマでやりましたが、今回はそれに簡単なプログラミングをつけてみたいと思います。  

フー！プログラマの腕が鳴るというものです。


## 音楽の調達

今日こそ、モテ路線です。レミオロメンとか、ガリレオガリレイとかビシーッと選んでやろうじゃないの、ということで選んだのがこれです。
ババーン。

<iframe width="420" height="315" src="http://www.youtube.com/embed/1dB8in_QRrw" frameborder="0" allowfullscreen></iframe>

いいんです。これでいいんです！(川平風)  
ありのままの姿でモテてこそ、真のモテ男子でしょう。

DLしてきたMP3をさくっとassetsに追加します。


## スクリプトの追加

そろそろ何か参考書でも買えよ、っていう感じですが、やはり手探りで進めてこそオツというものでしょう。
ググって済ませるのがよく訓練された職業プログラマの正しい姿勢ではないでしょうか。

なにかそれっぽいメニューはないかなーと探していたら、ありました。

Assets > Create

の中に、

* Javascript
* C# Script
* Boo Script

などなど、それっぽいのがあるではありませんか。（Boo Scriptってなんだ？）  
どれでもいけるのかな？  
そしたら、とりあえずは慣れ親しんでいる「Javascript」を選びたいと思います。ファイル名は当たり障りのない感じで「main.js」とでもしておきました。


## MonoDevelop

main.jsのinspectorに、「open」なんてボタンがあるものだからついつい押してしまったら、なんと組み込みのエディターみたいなものが立ち上がるじゃないですか！  
内心「うぜーーー」と思いつつも、Unity初心者の域を出ない僕としては贅沢は言ってられません。vim上に開発環境を置く作業はUnity中級になってからにします。

![MonoDevelop](/images/posts/2013-05-20-unity-study-04-easy-programing-play-sound-on-button-pushed/monodevelop.png)

さて。  
コーディングを始めましょうか。


## なにをすればよいのやら

```js
#pragma strict

function Start () {
     
}

function Update () {

}
```

main.js内にはデフォルトでこのような記述がされています。  
「function Start」は、シーンの開始時、あるいはアタッチされたオブジェクトのロード時に実行されるのかな？  
「function Update」は、シーンの描画時（再描画含む）にでも実行されるのかな？  
などと適当な想像を膨らませつつ、「じゃあ、ボタンを押した時のスクリプトはどうすればいいんじゃい！」と突っ込みます。  
ActionScriptで言うところの、ムービークリップに記述するonPressにあたる処理ですね。
イメージとしては、まずこのjsファイルを、特定のオブジェクトにアタッチ的な何かをする必要性がありそうです。


## 適当なオブジェクトを追加

というわけで、main.jsのアタッチ先にするために、何か適当にオブジェクトを画面上に配置してみることにします。  
僕は「GUI Text」をチョイスしました。テキストの中身は「ボタン」。プログラマらしい、実に的確に表現された文言です。

Hierarhy上のGUI Textに、ものは試しだとドラッグ＆ドロップでmain.jsを投げ込んでみました。
すると…、

> **Can't add script**  
> Can't add script behavior main.js. The scripts file name does not match the name of class defined in the script!

怒られました。  
勉強第4回目にしてやる内容じゃねえよ、出直してきな！と言われているような気がして、急に冷や汗が出てきました。

大丈夫。大丈夫さ…。君はやれる。いつだって困難を乗り越えてきたじゃないか。

と自分を励ましてみる。

ああ、そうさ。我が名は智史之介。日本を代表するエンジニアになる漢(おとこ)さ…。


## inspectorからのcomponentの追加

何度ドラッグ＆ドロップしても当然状況は改善しないので、別の方法を試してみることにしました。  
「GUI Text」をクリックして、inspectorウインドウから「add component」をクリック。  
なんとそこに「New script」の文字列が…！あるではないか、あるではないかとテンションが上がるのを抑えつつ、scriptを追加（言語はJavascriptを選択）。
おお、なんか、追加されたっぽい！

![スクリプトをアタッチ](/images/posts/2013-05-20-unity-study-04-easy-programing-play-sound-on-button-pushed/inspector.add.script.png)


## scriptの編集

先ほどの操作で、スクリプトとGameObjectの関連づけに成功しているはず。
なので、あとは「クリックされたとき」というイベントに処理を記述すればおｋ、ということになります。

一生懸命ググった結果、下記のようなコードを追加してみました。

```js
function OnMouseUpAsButton() {
  Debug.Log("pressed!!");
}
```

そして、プレビューして、無我夢中でクリック！！すると…、

![onPressイベント](/images/posts/2013-05-20-unity-study-04-easy-programing-play-sound-on-button-pushed/preview.onpress.png)

できてるよママ！


## さあ、あとはサウンドを再生すればいいだけ

もうすっかりドラッグ＆ドロップがくせになってしまっている僕は、assets内のサウンドファイルを、hierarhy上のGUI Textに投げ込んでみたら、なんかあっさり追加された。  
このままだと、開始時に即サウンドがなってしまうので、inspector上の「Play On Awake」のチェックを外しておきました。  
これを、プログラムで再生トリガーを引きたいのですぞ！

```js
var sound : AudioClip;
function OnMouseUpAsButton() {
  Debug.Log("pressed!!");
  audio.play();
}
```

ググりつつ、「こう書けばいいのだろうか？」という感じに適当に書いてみる。
複数のサウンドがアタッチされるケースだってあるし、これだとどのサウンドを鳴らせばいいのか全然わからないなー、Unity先生もお困りになるだろう、
なんて考えつつ、プレビューしてみる。そして「ボタン」をクリックしてみる。
すると…、

![onPressイベントでサウンド鳴った](/images/posts/2013-05-20-unity-study-04-easy-programing-play-sound-on-button-pushed/preview.sound.png)

鳴った…！ボタンを押したらサウンドが再生され始めました。  
へへっ。ちょろいもんだぜ☆

細かい疑問は色々とあるけれど、そのうち色々分かるでしょう、という甘い期待をしつつ今日はここまで〜！


## 次回に向けて

次回は、そうですね、、、なにげに今回のテーマが重たくてすっかりビクついてしまった僕は、「アニメーションGIFって扱えるの？」という少し軽めの（と思われる）テーマで行きたいと思います。
よろしくお願いします！



