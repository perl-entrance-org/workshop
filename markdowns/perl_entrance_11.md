# ![Perl入学式](/images/perl-entrance_t.png)
* スペースキーを押すと進み、ESCキーを押すと全体を俯瞰できます。
* [Chrome](https://www.google.com/intl/ja/chrome/browser/)や[Firefox](http://www.mozilla.jp/firefox/)でご覧ください。

# Perl入学式 #11
<http://www.perl-entrance.org>

* 日時
    * 2012年12月16日（日） 14:00 - 17:00
* 会場
    * Joe'sビジネスセンター
    * <http://www.joeswebhosting.net>

# Perl入学式について
* Perl入学式(<http://www.perl-entrance.org>)は, プログラミング未経験者からPerl初心者を対象としたワークショップです
* 公式Twitter
    * [@Perl_Entrance](http://twitter.com/perl_entrance)
* 公式ハッシュタグ
    * \#Perl入学式
* 公式Facebookページ
    * <https://www.facebook.com/PerlEntrance>

# 会場について
* 今回のPerl入学式は「Joe'sオープンソースJelly」の一環ということで、株式会社Joe'sクラウドコンピューティング（<http://www.joeswebhosting.net>）様より特別に会場をお借りしています
* この場をお借りしてお礼申し上げます

# ロゴについて
![Perl入学式](/images/perl-entrance_t_300.png)

* 横山陽平さん(<http://yokoyamayohei.com/>)にデザインしていただきました
* この場をお借りしてお礼申し上げます

# IT勉強会スタンプラリー
![IT勉強会スタンプラリー](/images/it-stamp.png)

* Perl入学式は, IT勉強会スタンプラリー(<http://it-stamp.jp/>)に参加しています
* 今回のPerl入学式は, スタンプラリーの対象となる勉強会です
* 台紙は勉強会終了後にお渡しします

# 喋ってる人
* 名前 ： 若林 信敬
* Twitter ： [@nqounet](http://twitter.com/nqounet)
* Facebook ： [nobutaka.wakabayashi](https://www.facebook.com/nobutaka.wakabayashi)
* 仕事 ： フリーエンジニア（IT系）
* 屋号 ： [IT Office 西宮原](http://www.nishimiyahara.net)

# \#11の目標
* Perl入学式の最終目標である簡易掲示板を、復習しながら実際に作成していきます。

# 本日の内容
## 本日の内容（その１）
* 開発環境の準備
* ファイルがない場合は作成する
* 記事を投稿したあとに記事を表示するページに戻る
* 記事を新しい順に表示する
* 空文字または空白だけの投稿は無効にする
* 投稿した時間を表示する

## 本日の内容（その２）
* 投稿した時間をもう少しちゃんと表示する
* 投稿した時間を好きな形式で表示する
* URLっぽい文字列をリンクにする
* HTMLタグをエスケープする
* 記事ではなくデータとして保存する
* リダイレクト後にメッセージを表示させる

# 開発環境の準備
* Perl
* Mojolicious
* 前回の最終型をダウンロード

## Perl
* `Perl`の環境を構築しておきましょう。

#### [Perl入学式: ModernなPerlの開発環境の構築方法（2012年8月版）](http://www.perl-entrance.org/p/modernperl20128.html)

## Mojolicious
* `Mojolicious`をインストールしておきましょう。

<!-- code -->

    $ cpanm Mojolicious

## 前回（\#10）の最終型をダウンロード（git版）
* ターミナル（端末）を起動して、適当なディレクトリに移動してから以下のコマンドを実行してください。

<!-- code -->

    $ git clone https://github.com/perl-entrance-org/perl-entrance-2012-10.git
    $ cd perl-entrance-2012-10

## 前回（\#10）の最終型をダウンロード（zip版）
* 以下のファイルをダウンロードしましょう。
* <https://github.com/perl-entrance-org/perl-entrance-2012-10/archive/master.zip>
* ダウンロードしたら、適当なフォルダに移動させて解凍（展開）してください。
* ターミナル（端末）を起動して、解凍後のフォルダに移動してください。

# ファイル検査
## データファイルがない場合は作成する
* [ソースコード](https://github.com/perl-entrance-org/perl-entrance-2012-11/commit/a7c784a7a4d748b19d1485e2ab2131816ed7540e)
* 参考になるページ
    * [-X - perldoc.jp](http://perldoc.jp/func/-X)

# リダイレクト
## 記事を投稿したあとに記事を表示するページに戻る
* [ソースコード](https://github.com/perl-entrance-org/perl-entrance-2012-11/commit/b6af6ab8f510d75cc5a71574317a7ab7595a5364)
* 参考になるページ
    * [redirect_to - Mojolicious::Controller](https://github.com/yuki-kimoto/mojolicious-guides-japanese/wiki/Mojolicious%3A%3AController#wiki-redirect_to)

# reverse
## 記事を新しい順に表示する
* [ソースコード](https://github.com/perl-entrance-org/perl-entrance-2012-11/commit/fa48cd9b66f147da9b66309891366743ce1c532e)
* 参考になるページ
    * [reverse - perldoc.jp](http://perldoc.jp/func/reverse)

# 正規表現
## 空白だけの投稿は無効にする
* [ソースコード](https://github.com/perl-entrance-org/perl-entrance-2012-11/commit/6d250825f452eccd94179dabe96077c61860424f)
* 参考になるページ
    * [perlretut - Perl の正規表現のチュートリアル - perldoc.jp](http://perldoc.jp/docs/perl/5.14.1/perlretut.pod)

# time
## 投稿した時間を表示する
* [ソースコード](https://github.com/perl-entrance-org/perl-entrance-2012-11/commit/ecb665009f18efebef0670b5c18423849c4d00db)
* 参考になるページ
    * [time - perldoc.jp](http://perldoc.jp/func/time)

# localtime
## 投稿した時間をもう少しちゃんと表示する
* [ソースコード](https://github.com/perl-entrance-org/perl-entrance-2012-11/commit/2726228599930f6876057e090c82f3bf67b259db)
* 参考になるページ
    * [localtime - perldoc.jp](http://perldoc.jp/func/localtime)

# Time::Piece
## 投稿した時間を好きな形式で表示する
* [ソースコード](https://github.com/perl-entrance-org/perl-entrance-2012-11/commit/ef04e9b712c922a4d9f228e1a397504bec23135b)
* 参考になるページ
    * [Time::Piece - オブジェクト指向な時間オブジェクト - perldoc.jp](http://perldoc.jp/docs/modules/Time-Piece-1.08/Piece.pod)
    * [sprintf - perldoc.jp](http://perldoc.jp/func/sprintf)

# 正規表現その2
## URLっぽい文字列をリンクにする
* [ソースコード](https://github.com/perl-entrance-org/perl-entrance-2012-11/commit/a03bd399f2361e049f00db6e106ab2fac055fa7d)
* 参考になるページ
    * [httpURL - Perlメモ](http://www.din.or.jp/~ohzaki/perl.htm#httpURL)
    * [chomp - perldoc.jp](http://perldoc.jp/func/chomp)

# helper
## HTMLタグをエスケープする
* [ソースコード](https://github.com/perl-entrance-org/perl-entrance-2012-11/commit/c03d0eac621ef3281df1e116e4673cbb58e51e2e)
* 参考になるページ
    * [helper - Mojolicious](https://github.com/yuki-kimoto/mojolicious-guides-japanese/wiki/Mojolicious#wiki-helper)
    * [xml_escape - Mojo::Util](https://github.com/yuki-kimoto/mojolicious-guides-japanese/wiki/Mojo%3A%3AUtil#wiki-xml_escape)

# データ構造
## 記事ではなくデータとして保存する
* [ソースコード](https://github.com/perl-entrance-org/perl-entrance-2012-11/commit/09d77f2546c368cc1d18922ffbfc1cb5e646ae51)
* 参考になるページ
    * [perldsc - Perl のデータ構造クックブック - perldoc.jp](http://perldoc.jp/docs/perl/5.14.1/perldsc.pod)
    * [Mojo::JSON](https://github.com/yuki-kimoto/mojolicious-guides-japanese/wiki/Mojo%3A%3AJSON)

# flash
## リダイレクト後にメッセージを表示させる
* [ソースコード](https://github.com/perl-entrance-org/perl-entrance-2012-11/commit/9b6f3bda135828de0bcbf1d14790b4b1df2e0d54)
* 参考になるページ
    * [flash - Mojolicious::Controller](https://github.com/yuki-kimoto/mojolicious-guides-japanese/wiki/Mojolicious%3A%3AController#wiki-flash)

# 質問タイム

# お疲れさまでした
