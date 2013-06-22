---
layout: post
title: "【AdobeEdgeAnimate】AdobeEdgeAnimateのHTMLはどうやって書くのか"
date: 2013-06-22 16:30
comments: true
categories: AdobeEdgeAnimate デザイン
author: kametama
---

今回はAdobeEdgeAnimateのHTMLを書いてみようです！

外部スクリプトをAdobeEdgeAnimateに読み込みしたい場合

（例）
```javascript
<script type="text/javascript">
//ココにコードを記述する 
</script>
```

上記をHTMLに記述しなければなりません。

しかし、

![画像1](/images/posts/2013-06-22-how-to-edit-html-in-adobe-edge-animate/image1.png)

JavaScriptコードを書く場所はAdobeEdgeAnimate内でありますが、
HTMLを書く場所はありません。

そこで今回はどうやってHTMLを書くのかを調査してみました。

テキストエディットでデータから吐き出されたhtmlファイルを開いてみるとロックされていて
次の瞬間、あれ？データ壊れた？ほわーい？

・・・・・・・・・・・・・

どうやらhtmlデータが壊れるとAdobeEdgeAnimate内のデータも壊れるみたいで
作ったエレメントなどが消えてしまいます！
また同じフォルダにhtmlデータがなくなるとAdobeEdgeAnimateデータがエラーで開けなくなるので
必ず一緒にあることを確認しましょう。

気を取り直してデータを作ってやり直し！

![画像2](/images/posts/2013-06-22-how-to-edit-html-in-adobe-edge-animate/image2.png)

赤、青、緑をtrue/falseで表示させるよう作ってみました。
これをhtmlに外部スクリプトとして打ち込んでみました。
まずはテキストエディットにhtmlをドラッグ・・・

あー・・・macってテキストエディットにhtmlファイルをドラッグしてもurlしか出てこないんですねー
winよりふべn⬅
さ、環境設定をし直して表示させました。

![画像3](/images/posts/2013-06-22-how-to-edit-html-in-adobe-edge-animate/image3.png)

ここに赤、青、緑のtrue/falseを入れていきます。

![画像4](/images/posts/2013-06-22-how-to-edit-html-in-adobe-edge-animate/image4.png)

こんな感じ！
web上で確認出来るか確認して見てみると

![画像5](/images/posts/2013-06-22-how-to-edit-html-in-adobe-edge-animate/image5.png)

ちゃんと青だけ表示されてますね！
このようにテキストエディットでhtmlを直接書き込むことが出来ました。
AdobeEdgeAnimate内で書き込めれば一番便利なのですけどねぇ…。


テキストエディットがロックされて編集できなかった際にテキストエディット以外のツールを試してみました。

Adobe Edge Code Preview 3  
![画像アイコン](/images/posts/2013-06-22-how-to-edit-html-in-adobe-edge-animate/icon.png)

![画像6](/images/posts/2013-06-22-how-to-edit-html-in-adobe-edge-animate/image6.png)

おーっときましたよ、日本語対応なしw
とりあえず使ってみましょう。
htmlをドラッグして…
ん？無反応？？何も表示されない…
ファイルを開くから選ばないと開かないらしいです。
不便ですn⬅

![画像7](/images/posts/2013-06-22-how-to-edit-html-in-adobe-edge-animate/image7.png)

このAdobe Edge Code Preview 3ツール
実はCSS、HTML、JavaScript対応しているようで一気に３つのソースを見ながら打ち込むことが出来る便利ツールのようです！！一個の窓で全部が見れるのはいいですね！！
webでHTMLとCSSをいじる人にはとっても便利です。
このツールでもAdobeEdgeAnimateのhtmlをいじることも出来ます。

これでどれでもHTMLいじれるね！安心だね！
と思いきやここでAdobeEdgeAnimateの落とし穴があります。

先ほど書き込んだhtmlデータを保存したあと、
AdobeEdgeAnimateのデータをいじる（検証では再生停止のsym.stop();をはずしてみた）と
なんとHTMLに書き込んだ外部スクリプトが消えています！ひゃー！
どうやらAdobeEdgeAnimatesw更新をする度にhtmlファイルは書き換えられるようです。
その度に消えると地獄が待っています。
どうにか消えないようにしてみたのですがダメでした…。

今の時点ではAdobeEdgeAnimateでアニメーションの動きを作った後でJavaScriptいれ
最終的にHTMLに外部スクリプトを入れ更新する
という作業になりそうです。

中々にAdobeEdgeAnimateは手強いようです。


今回の反省点
データが消えるとは思ってなかった。
もっと簡単に消えないようHTML打てたら…。


