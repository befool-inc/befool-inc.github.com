---
layout: post
title: "Unity勉強 第7回 「Android向けのビルドも試してみる」"
date: 2013-05-29 21:24
comments: true
categories: unity 勉強
author: 8823-scholar
---

## 前回のおさらい＆今日の目標

おはようございます。深田恭子ともっとも結婚したい漢(おとこ)、智史之介です。  
今日も今日とて、unity勉強をおこないたいと思います。

さて、前回は[無償化されたiOS向けのビルド](/blog/2013/05/23/unity-study-06-build-for-ios/)を試しました。  
今日はその流れで「Android向けのビルド」も試してみたいと思います。


## 前回のプロジェクトをコピー

今回もさくっと前回のプロジェクトをコピーしてしまいましょう。


## Build Settingsはとにかくデフォ

前回にならって「File > Build Settings」で項目をざらっと眺めてみたのですが、どうもどれもこれもデフォでいけそうな雰囲気です(甘い期待)。  
ものは試しということで、とくにどの設定も気にかけないでいこうと思います

![デフォ！](/images/posts/2013-05-29-unity-study-07-build-for-android/settings.png)


## Android SDKのインストール＆設定

iOSは、パブリッシュに関してXcode＋SDKのインストール＆設定が必須でした。  
Androidには似たようなものはないの？ということですが、それが「Android SDK」になります。

[Android SDK](http://developer.android.com/sdk/index.html)

ダウンロードしてインスコします。  
インストールにあたって、Unityのドキュメントを軽く眺めておくとよいかもしれないですね。

[Unity Manual - Android SDK セットアップ](http://docs-jp.unity3d.com/Documentation/Manual/android-sdksetup.html)

```bash
$ /path/to/android-sdk/tools/android
```

とコマンドを打つと、android sdkに関するツールが立ち上がるので、

![こんなかんじ](/images/posts/2013-05-29-unity-study-07-build-for-android/android-sdk.png)

こんな感じで入れておけばいいんじゃないでしょうか？（適当）

### Unity Preferencesも忘れずに

Unity > Preferences（Cmd+,）で設定画面を開き、「External Tools」を選択すると、中にAndroid SDKのパスに関する項目があります。  
めんどくさいですが設定しましょう。

![こんなかんじ](/images/posts/2013-05-29-unity-study-07-build-for-android/preferences.png)


## さあ、ビルドぜよ！

Build Settings > build

でビルドを開始してください。ビルドが無事完了すると、Finderが開く…あれ、開かない。  
iOSでは開いたのに！もしかして、ビルド失敗したかな？と思って、保存先を確認してみると…、ない！
やっぱりビルドに失敗しているようだ。

Consoleにエラーがでている。なになに。

> Error building Player: Exception: android (invokation failed)
> ERROR: unknown error
> cmd:android list target -c
> stdout: Error: occurred during initialization of VM Could not reserve enough space for object heap
> stderr: Error: Could not create the Java Virtual Machine. Error: A fatal exception has occurred. Program will exit.

脊髄反射でググってみる。

[Error building Player: Exception: android (invokation failed) ERROR: unknown error](http://answers.unity3d.com/questions/399121/error-building-player-exception-android-invokation.html)

> Also you can downgrade the tools version to r21 by installing:

ダウングレードしてみたら、と言っている。ふむ。そういえば、さっきアップグレードしちゃった…。  
というわけでダウングレードします。

[Android SDK rev21](http://dl.google.com/android/android-sdk_r21-macosx.zip)

DL＆解凍したら、toolsを上書きしちゃってください。そして再度「platform-tools」もインストールし直してください。
これでダウングレード完了です。


## 改めて、ビルドぜよ！

さあ、もうこれでいけるでしょう。

Build Settings > build

さあ、どうなるかな！

(ビルド中…)  
(mac機がものすごい勢いでファンを回しているぜ…)

終わった！Finderでビルド先のディレクトリが開いた。  
ファイル名は「android.apk」。  
ひねりのない命名で申し訳ない気持ちでいっぱいです。

このapkファイルを下記のコマンドで端末に転送します。

```bash
$ /path/to/android-sdk/platform-tools/adb start-server
# ここでandroid端末をUSBで接続
$ /path/to/android-sdk/platform-tools/adb devices
List of devices attached
015d8ecf9927f410    device
$ /path/to/android-sdk/platform-tools/adb install -r 07.Build4Android/android.apk
1280 KB/s (8335911 bytes in 6.355s)
    pkg: /data/local/tmp/android.apk
Success
```

![インストール成功](/images/posts/2013-05-29-unity-study-07-build-for-android/android.installed.png)

入ってる！
起動も問題なさそうです。

よし、いいでしょう！


## 今回の反省

* 迂闊に、android-sdkのアップデートはしない

ちょっとはまりました…。


## 次回に向けて

iOSとAndroid向けのビルドも成功しました。一歩一歩確実に進んでいけているような気がして、非常に嬉しいです。  
次の課題は「シーンとシーンの切り替え」を試してみようと思います！  
それではまた。シーユー！

