---
layout: post
title: "Octopressへの投稿環境の作り方"
date: 2013-05-01 03:02
comments: true
categories: octopress
author: 8823-scholar
---

## 前置き

このエントリーは、Octopressのセットアップに関する記事ではありません。  
Octopressを共同編集するにあたっての、個人環境構築に関する記事になります。  


## 準備作業

### ruby 1.9.3以上のインストール

```bash
$ ruby --version
ruby 1.9.3p374 (2013-01-15 revision 38858) [x86_64-darwin12.2.1]
```

もしバージョンが低かったり「no such command」とか言われちゃう場合は、この際なのでrbenvを導入しちゃいましょう。

```bash
# まずはrbenvのインストール
$ brew install rbenv ruby-build
$ echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
$ echo 'eval "$(rbenv init -)"' >> ~/.bashrc
$ source ~/.bashrc

# 1.9.3p374をインストール
$ rbenv install 1.9.3p374
```

### windowsの人は

cygwinでもインストールしてみて！


## Octopress環境を構築しよう

### 「befool-inc/befool-inc.github.com.git」のclone

```bash
$ cd path/to/workspace
$ git clone git@github.com:befool-inc/befool-inc.github.com.git
$ cd befool-inc.github.com
$ git checkout -b source remotes/origin/source
```

### 依存ライブラリの取得

```bash
$ gem install bundler
$ bundle install
```

### rakeタスクの確認

Octopressのrakeタスクが一覧されるか試してみましょう。

```bash
$ rake -T
rake clean                     # Clean out caches: .pygments-cache, .gist-cache, .sass-cache
rake copydot[source,dest]      # copy dot files for deployment
rake deploy                    # Default deploy task
rake gen_deploy                # Generate website and deploy
rake generate                  # Generate jekyll site
rake install[theme]            # Initial setup for Octopress: copies the default theme into the path of Jekyll's generator.
rake integrate                 # Move all stashed posts back into the posts directory, ready for site generation.
rake isolate[filename]         # Move all other posts than the one currently being worked on to a temporary stash location (stash) so regenerating the site happens much more quickly.
rake list                      # list tasks
rake new_page[filename]        # Create a new page in source/(filename)/index.markdown
rake new_post[title]           # Begin a new post in source/_posts
rake preview                   # preview the site in a web browser
rake push                      # deploy public directory to github pages
rake rsync                     # Deploy website via rsync
rake set_root_dir[dir]         # Update configurations to support publishing to root or sub directory
rake setup_github_pages[repo]  # Set up _deploy folder and deploy branch for Github Pages deployment
rake update_source[theme]      # Move source to source.old, install source theme updates, replace source/_includes/navigation.html with source.old's navigation
rake update_style[theme]       # Move sass to sass.old, install sass theme updates, replace sass/custom with sass.old/custom
rake watch                     # Watch the site and regenerate when it changes
```

こんな感じで表示されればOKだ。


## 記事を書いてみる

### 箱形の作成

まずは記事を書くための箱形の作成を行います。

```bash
$ rake new_post['foo bar zoo']
mkdir -p source/_posts
Creating new post: source/_posts/2013-05-01-foo-bar-zoo.markdown
```

### markdownの編集

markdown形式で記事を書きます

```bash
$ vi source/_posts/2013-05-01-foo-bar-zoo.markdown
```

### プレビュー

Octopressではローカルで記事のプレビューが可能です。

```bash
# 公開用ファイル群を生成
$ rake generate

# プレビュー
$ rake preview
```

WEBブラウザを開いて、「[http://localhost:4000/](http://localhost:4000/)」へアクセスしてみてください。  
表示されましたか？


## デプロイ

当たり前の話ではありますが、ローカルで記事を書いただけではWEB上に公開されません。  
Octopressはgithubへのコミットまで面倒を見てくれます。  

```bash
$ rake deploy
```

これで、記事がWEBに公開されました！おめでとう！

