---
layout: post
title: "【AdobeEdgeAnimate】ベクターデータをFlashからEdgeへ"
date: 2013-06-07 18:13
comments: true
categories: flash AdobeEdgeAnimate illustrator
author: jun-nakada
---

こんばんは。デザイン部フラッシャー 中田です。

![画像1](/images/posts/2013-06-07-vector-data-convert-to-illustrator-from-flash/1.png)


最近HTML5だとかAdobeEdgeAnimate(アドビエッジアニメイト)だとか言われてますが、
今までFlashを使っていた者としては、めんどくせーよ…と思うわけです。

Flashは「ここもっとキラっとさせてー」なんての定番の注文を言われた時も
Flash内で星などのベクター画像がヒョイと描けたんですが、Edgeではそうもいきません。

Edge内では簡単な丸や四角のベクター画像しか描けません。
なんて不便なんでしょう…。
なのでIllustratorを使い、星を描いて
なんだか分けわからん形式にして読み込んで…と一手間二手間掛かるわけですよ。

まぁそれは仕方ないとして、問題なのは今までFlash内で描いていた素材だったり
AIデータが無くライブラリにしか保存されていない画像を持ってくる場合です。

![画像2](/images/posts/2013-06-07-vector-data-convert-to-illustrator-from-flash/2.png)

試しに単純にベクター画像をEdgeに直接コピペしてみましたが、対応してないみたいです。
世の中そんなに甘くないですね。

じゃあIllustratorにコピペはどうだ？

![画像3](/images/posts/2013-06-07-vector-data-convert-to-illustrator-from-flash/3.png)

ダメですね。背景色が付いてきてしまいます。

似たようなものをIllustratorで描き直すのも一つの手段ではありますが、面倒ですよね。
また、自分で描いたものであれば再現もできますが、他人が作った素材だとなかなか難しい…。


なのでやり方を色々探してみた所、一つ方法を発見しました！
ここではその方法について説明したいと思います。
※所々画像が違うのは気にしないでください！


まず、Flash(FLAファイル)からEdgeに移動したいベクター画像を選択します。

ファイルから書き出し⇒イメージの書き出し を選択します。

![画像4](/images/posts/2013-06-07-vector-data-convert-to-illustrator-from-flash/4.png)

ファイルの種類から「Adobe FXG」を選択して任意の場所に保存します。

![画像5](/images/posts/2013-06-07-vector-data-convert-to-illustrator-from-flash/5.png)

![画像6](/images/posts/2013-06-07-vector-data-convert-to-illustrator-from-flash/6.png)

このFXGという形式、全然知らなかったのでググってみると、
AdobeFlex(アドビフレックス)で使うものだそうです。
んー、なんだかよく分からんので見なかったことに。

とりあえずこの謎のファイルFXGをIllustratorに読み込むと･･･。

![画像7](/images/posts/2013-06-07-vector-data-convert-to-illustrator-from-flash/7.png)

見れるじゃないか！スバラシイ！
背景色もついてないですね。

それで、これをIllustratorからSVG形式で保存します。

![画像13](/images/posts/2013-06-07-vector-data-convert-to-illustrator-from-flash/13.png)

このSVG形式も今日初めて知ったんですが、ググってみると
『XMLベースの2Dベクター画像記述言語』だそうです。
つまりどういうこと？

社長「中身見たらわかる」

ふむ。中身ですか…。
とりあえずSVG形式はブラウザで開けるようなので、
Chromeに放り込んでソースを見てみると…。

![画像9](/images/posts/2013-06-07-vector-data-convert-to-illustrator-from-flash/9.png)

なーるほど、全部テキストなんですね。
誰がこんなの思いつくんですかね。天才だと思います。

話を戻しまして
AdobeEdgeにベクター画像を読み込むには上記のSVGとかいう形式にしないといけないわけです。
ファイル形式をSVGにして保存。

![画像8](/images/posts/2013-06-07-vector-data-convert-to-illustrator-from-flash/8.png)


あとはお好きな方法でEdgeに読み込んで配置。

はい、成功です！
アルファ値があるものも大丈夫みたいです。

![画像10](/images/posts/2013-06-07-vector-data-convert-to-illustrator-from-flash/10.png)

Edge内で見るとぼやけてるってるように見えますが、
実際にブラウザなどで拡大してみると問題ないようです。

![画像11](/images/posts/2013-06-07-vector-data-convert-to-illustrator-from-flash/11.png)

![画像11](/images/posts/2013-06-07-vector-data-convert-to-illustrator-from-flash/12.png)


他にもっと簡単な方法をご存知の方、是非コメントください。

